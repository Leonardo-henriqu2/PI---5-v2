import 'dart:convert';
import 'package:shelf/shelf.dart';
import '../db.dart';

class CarController {
  final DatabaseService dbService;

  CarController(this.dbService);

  // CREATE
  Future<Response> createCar(Request request) async {
    final body = jsonDecode(await request.readAsString());
    final userId = body['user_id'];
    final model = body['model'];
    final buying = body['buying'];
    final maint = body['maint'];
    final doors = body['doors'];
    final persons = body['persons'];
    final lugBoot = body['lug_boot'];
    final safety = body['safety'];
    final classType = body['class'];

    final db = await dbService.database;

    try {
      db.execute('''
        INSERT INTO cars (
          user_id, 
          model, 
          buying, 
          maint, 
          doors, 
          persons, 
          lug_boot, 
          safety, 
          class
        ) VALUES (
          ?, ?, ?, ?, ?, ?, ?, ?, ?
        )
      ''', [
        userId, 
        model, 
        buying, 
        maint, 
        doors, 
        persons, 
        lugBoot, 
        safety, 
        classType
      ]);

      return Response.ok('Car created');
    } catch (e) {
      return Response.internalServerError(body: 'Failed to create car: $e');
    }
  }

  // READ all
  Future<Response> getCars(Request request) async {
    List<Map<String, dynamic>> carsList = [];
    final db = await dbService.database;

    try {
      final result = db.select('SELECT * FROM cars');

      for (var row in result) {
        carsList.add({
          'id': row['id'],
          'user_id': row['user_id'],
          'model': row['model'],
          'buying': row['buying'],
          'maint': row['maint'],
          'doors': row['doors'],
          'persons': row['persons'],
          'lug_boot': row['lug_boot'],
          'safety': row['safety'],
          'class': row['class'],
        });
      }

      return Response.ok(jsonEncode(carsList), headers: {'Content-Type': 'application/json'});
    } catch (e) {
      return Response.internalServerError(body: 'Failed to retrieve cars: $e');
    }
  }

  // READ one
  Future<Response> getCar(Request request, String id) async {
    final db = await dbService.database;

    try {
      final result = db.select('SELECT * FROM cars WHERE id = ?', [id]);
      if (result.isEmpty) {
        return Response.notFound('Car not found');
      }
      final car = result.first;

      return Response.ok(jsonEncode({
        'id': car['id'],
        'user_id': car['user_id'],
        'model': car['model'],
        'buying': car['buying'],
        'maint': car['maint'],
        'doors': car['doors'],
        'persons': car['persons'],
        'lug_boot': car['lug_boot'],
        'safety': car['safety'],
        'class': car['class'],
      }), headers: {'Content-Type': 'application/json'});
    } catch (e) {
      return Response.internalServerError(body: 'Failed to retrieve car: $e');
    }
  }

  // UPDATE
  Future<Response> updateCar(Request request, String id) async {
    final body = jsonDecode(await request.readAsString());
    final userId = body['user_id'];
    final model = body['model'];
    final buying = body['buying'];
    final maint = body['maint'];
    final doors = body['doors'];
    final persons = body['persons'];
    final lugBoot = body['lug_boot'];
    final safety = body['safety'];
    final classType = body['class'];

    final db = await dbService.database;

    try {
      db.execute('''
        UPDATE cars 
        SET 
          user_id = ?, 
          model = ?, 
          buying = ?, 
          maint = ?, 
          doors = ?, 
          persons = ?, 
          lug_boot = ?, 
          safety = ?, 
          class = ? 
        WHERE id = ?
      ''', [
        userId, 
        model, 
        buying, 
        maint, 
        doors, 
        persons, 
        lugBoot, 
        safety, 
        classType, 
        id
      ]);

      return Response.ok('Car updated');
    } catch (e) {
      return Response.internalServerError(body: 'Failed to update car: $e');
    }
  }

  // DELETE
  Future<Response> deleteCar(Request request, String id) async {
    final db = await dbService.database;

    try {
      db.execute('DELETE FROM cars WHERE id = ?', [id]);
      return Response.ok('Car deleted');
    } catch (e) {
      return Response.internalServerError(body: 'Failed to delete car: $e');
    }
  }
}