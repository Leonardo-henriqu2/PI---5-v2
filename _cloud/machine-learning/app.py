import pickle
from flask import Flask, jsonify, request, render_template
from src.data_preprocessing import preprocess_json

app = Flask(__name__)

@app.route('/', methods=['GET'])
def home():
    return render_template('home.html', PORT=5000)

with open('src/mlp_model.pkl', 'rb') as f:
    model = pickle.load(f)

@app.route('/predict', methods=['POST'])
def predict():
    # Obter os dados do corpo da requisição
    data = request.get_json()

    # Verificar se os dados são um dicionário (JSON)
    if isinstance(data, dict):
        # Processa os dados recebidos
        processed_data = preprocess_json(data)
    else:
        return jsonify({"error": "Invalid data format. Expected JSON."}), 400

    # Fazer a previsão
    prediction = model.predict(processed_data)

    # Retornar a previsão como resposta
    return jsonify({'prediction': prediction.tolist()})

if __name__ == '__main__':
    PORT = 5000
    print(f'Starting machine learning server on port: {PORT}')
    app.run(port=PORT, debug=True)