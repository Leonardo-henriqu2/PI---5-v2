from joblib import load
from flask import Flask, jsonify, request, render_template
from src.data_preprocessing import process_json

app = Flask(__name__)

@app.route('/', methods=['GET'])
def home():
    return render_template('home.html', PORT=5000)

model = load('./src/mlp_model.pkl')

@app.route('/predict', methods=['POST'])
def predict():
    # Obter os dados do corpo da requisição
    data = request.get_json()
    print(data)

    # Verificar se os dados são um dicionário (JSON)
    if isinstance(data, dict):
        required_keys = ["buying", "maint", "doors", "persons", "lug_boot", "safety"]
        if not all(key in data for key in required_keys):
            return jsonify({"error": "Missing one or more required fields."}), 400
        
        # Processa os dados recebidos
        processed_data = process_json(data)
        print("Model type:", type(model))  # Verifica o tipo do modelo

        print("Processed data shape:", processed_data.shape)
        print("Processed data columns:", processed_data.columns)

        # Verifique se a forma é (1, n) onde n é o número de características
        if processed_data.shape[0] != 1:
            return jsonify({"error": "Processed data should have one row."}), 400
        
    else:
        return jsonify({"error": "Invalid data format. Expected JSON."}), 400

    # try:
    #     # Fazer a previsão
    #     prediction = model.predict(processed_data)
    #     print(prediction)

    #     # Retornar a previsão como resposta
    #     return jsonify({'prediction': prediction.tolist()})
    # except Exception as e:
    #     return jsonify({"error": str(e)}), 500
    
    # Fazer a previsão
    prediction = model.predict(processed_data)
    print(prediction)
        
    # Retornar a previsão como resposta
    return jsonify({'prediction': prediction.tolist()})


if __name__ == '__main__':
    PORT = 5000
    print(f'Starting machine learning server on port: {PORT}')
    app.run(port=PORT, debug=True)