import 'dart:convert';
import 'package:shelf/shelf.dart';
import '../db.dart';

class UserController {
  final DatabaseService dbService;

  UserController(this.dbService);

  // CREATE
  Future<Response> createUser(Request request) async {
    final body = jsonDecode(await request.readAsString());
    final username = body['username'];
    final hashe = body['hashe'];
    final db = await dbService.database;

    try {
      db.execute('INSERT INTO users (username, hashe) VALUES (?, ?)', [username, hashe]);
      return Response.ok('User created');
    } catch (e) {
      return Response.internalServerError(body: 'Failed to create user: $e');
    }
  }

  // READ all
  Future<Response> getUsers(Request request) async {
    List<Map<String, dynamic>> usersList = [];
    final db = await dbService.database;

    try {
      final result = db.select('SELECT * FROM users');

      for (var row in result) {
        usersList.add({
          'id': row['id'],
          'username': row['username'],
          'hashe': row['hashe'],
        });
      }

      return Response.ok(jsonEncode(usersList), headers: {'Content-Type': 'application/json'});
    } catch (e) {
      return Response.internalServerError(body: 'Failed to retrieve users: $e');
    }
  }

  // READ one
  Future<Response> getUser(Request request, String id) async {
    final db = await dbService.database;
    
    try {
      final result = db.select('SELECT * FROM users WHERE id = ?', [id]);
      if (result.isEmpty) {
        return Response.notFound('User not found');
      }
      final user = result.first;

      return Response.ok(jsonEncode({
        'id': user['id'],
        'username': user['username'],
        'hashe': user['hashe'],
      }), headers: {'Content-Type': 'application/json'});
    } catch (e) {
      return Response.internalServerError(body: 'Failed to retrieve user: $e');
    }
  }

  // UPDATE
  Future<Response> updateUser(Request request, String id) async {
    final body = jsonDecode(await request.readAsString());
    final username = body['username'];
    final hashe = body['hashe'];
    final db = await dbService.database;

    try {
      db.execute('UPDATE users SET username = ?, hashe = ? WHERE id = ?', [username, hashe, id]);
      return Response.ok('User updated');
    } catch (e) {
      return Response.internalServerError(body: 'Failed to update user: $e');
    }
  }

  // DELETE
  Future<Response> deleteUser(Request request, String id) async {
    final db = await dbService.database;

    try {
      db.execute('DELETE FROM users WHERE id = ?', [id]);
      return Response.ok('User deleted');
    } catch (e) {
      return Response.internalServerError(body: 'Failed to delete user: $e');
    }
  }
}