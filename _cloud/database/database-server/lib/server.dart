import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
// import 'database/db.dart';

Future<void> main() async {
  // final dbService = DatabaseService();
  // final database = await dbService.database;

  // Configuração do servidor
  var handler = const Pipeline()
      .addMiddleware(logRequests())
      .addHandler(_echoRequest);

  // Iniciar o servidor
  var server = await serve(handler, 'localhost', 3000);
  print('Servidor rodando em http://${server.address.host}:${server.port}');
}

Response _echoRequest(Request request) {
  return Response.ok('Olá, seu servidor está funcionando!');
}