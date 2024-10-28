import 'package:http/http.dart' as http;
import 'dart:convert';

/// Envia um request em formato JSON para o servidor Python local
Future<void> sendPredictionRequest() async {
  /**
   * Use o IP do seu servidor se não estiver no emulador.
   * Caso contrário, se estiver testando em um emulador 
   * Android, use o IP 10.0.2.2
   */
  final url = Uri.parse('http://localhost:5000/predict');

  final response = await http.post(
    url,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({
      "buying": "vhigh",
      "maint": "low",
      "doors": "4",
      "persons": "more",
      "lug_boot": "big",
      "safety": "high"
    }),
  );

  if (response.statusCode == 200) {
    print('Response data: ${response.body}');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }

  /**
   * A resposta deve ser:
   * 
   * Response data: {
   *   "prediction": [
   *     "acc"
   *   ]
   * }
   */
}

/// Chama a função ao executar o arquivo
void main() {
  sendPredictionRequest();
}