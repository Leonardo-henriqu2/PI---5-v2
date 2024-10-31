import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import './controllers/user_controller.dart';
import './controllers/car_controller.dart';
import './db.dart';

Future<void> main() async {
  final dbService = DatabaseService();
  await dbService.database;

  final router = Router();
  final userController = UserController(dbService);
  final carController = CarController(dbService);

  // Rotas para usuários
  router.post('/users', userController.createUser);
  router.get('/users', userController.getUsers);
  router.get('/users/<id>', userController.getUser);
  router.put('/users/<id>', userController.updateUser);
  router.delete('/users/<id>', userController.deleteUser);

  // Rotas para carros
  router.post('/cars', carController.createCar);
  router.get('/cars', carController.getCars);
  router.put('/cars/<id>', carController.updateCar);
  router.delete('/cars/<id>', carController.deleteCar);

  // Configuração do servidor
  var handler = const Pipeline()
      .addMiddleware(logRequests())
      .addHandler(router);

  // Iniciar o servidor
  var server = await serve(handler, 'localhost', 3000);
  print('Servidor rodando em http://${server.address.host}:${server.port}');
}