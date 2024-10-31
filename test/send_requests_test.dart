import 'package:http/http.dart' as http;
import 'dart:convert';

/// Mapeamento para traduzir valores
final Map<String, String> translations = {
  'vhigh' : 'Muito Alto',
  'high'  : 'Alto',
  'med'   : 'Médio',
  'low'   : 'Baixo',
  '2'     : '2',
  '3'     : '3',
  '4'     : '4',
  '5'     : '5 ou mais',
  '5more' : '5 ou mais',
  'more'  : 'Várias',
  'small' : 'Pequeno',
  'big'   : 'Grande',
  'unacc' : 'Inaceitável',
  'acc'   : 'Aceitável',
  'good'  : 'Bom',
  'vgood' : 'Muito Bom',
};

/// Envia um request em formato JSON para o servidor Python local
Future<void> sendPredictionRequest() async {
  final url = Uri.parse('http://localhost:5000/predict');

  /**
   * Use o IP do seu servidor se não estiver no emulador.
   * Caso contrário, se estiver testando em um emulador 
   * Android, use o IP 10.0.2.2
   */
  final response = await http.post(
    url,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({
      "buying"    : "vhigh",
      "maint"     : "low",
      "doors"     : "4",
      "persons"   : "more",
      "lug_boot"  : "big",
      "safety"    : "high"
    }),
  );

  if (response.statusCode == 200) {
    final responseData = jsonDecode(response.body);
    final prediction = responseData['prediction'].first;

    print('Response data: ${response.body}');
    /**
     * A resposta deve ser:
     * 
     * Response data: {
     *   "prediction": [
     *     "acc"
     *   ]
     * }
     */

    /**
     * Salva os dados no banco de dados
     */
    await saveDataToDatabase(
      buying      : translate('vhigh'),
      maint       : translate('low'),
      doors       : translate('4'),
      persons     : translate('more'),
      lugBoot     : translate('big'),
      safety      : translate('high'),
      prediction  : translate(prediction),
    );
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

/// Função para traduzir valores
String translate(String value) {
  /**
   * Retorna o valor original se não houver tradução
   */
  return translations[value] ?? value;
}

/// Função para salvar dados no banco de dados
Future<void> saveDataToDatabase({
  required String buying, 
  required String maint,
  required String doors,
  required String persons,
  required String lugBoot,
  required String safety,
  required String prediction,
}) async {
  final dbUrl = Uri.parse('http://localhost:3000/cars');
  /**
   * Insere dados pré deternimados que o 
   * algoritmo é incapaz de manipular. 
   * Para isso seria necessário adicionar 
   * uma regra que não envia esses campos 
   * ou uma regra que exclui esses atributos 
   * durante o tratamento de dados no algoritmo.
   */
  const int userId = 1;
  const String model = "Gwm Haval H6 Gt Suv Cup Esportivo";

  final response = await http.post(
    dbUrl,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({
      "user_id"   : userId,
      "model"     : model,
      "buying"    : buying,
      "maint"     : maint,
      "doors"     : doors,
      "persons"   : persons,
      "lug_boot"  : lugBoot,
      "safety"    : safety,
      "class"     : prediction,
    }),
  );

  if (response.statusCode == 200) {
    print('Data saved to the database successfully.');
  } else {
    print('Failed to save data: ${response.statusCode}.');
  }
}

/// Função para buscar os carros do banco de dados
Future<void> fetchCars() async {
  final dbUrl = Uri.parse('http://localhost:3000/cars');
  final response = await http.get(dbUrl);

  if (response.statusCode == 200) {
    final carsList = jsonDecode(response.body);
    print('Carros salvos no banco:');
    for (var car in carsList) {
      print(car);
    }
  } else {
    print('Failed to fetch cars: ${response.statusCode}.');
  }
}

/// Chama a função ao executar o arquivo
void main() async {
  await sendPredictionRequest();
  await fetchCars();
}