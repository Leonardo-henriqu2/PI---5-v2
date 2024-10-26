from flask import Flask, jsonify, request, render_template

app = Flask(__name__)

@app.route('/', methods=['GET'])
def home():
    return render_template('home.html', PORT=5000)

@app.route('/predict', methods=['POST'])
def predict():
    data = request.json

    # O servidor chamará o algoritmo que retornará a resposta JSON
    return jsonify({'prediction': 'resultado do algoritmo'})

if __name__ == '__main__':
    PORT = 5000
    print(f'Starting machine learning server on port: {PORT}')
    app.run(port=PORT, debug=True)