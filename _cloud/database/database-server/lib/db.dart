import 'dart:io';
import 'package:sqlite3/sqlite3.dart';
import 'package:path/path.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;

  Database? _database;

  DatabaseService._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;

    // Define o caminho do banco de dados
    String dbPath = join(Directory.current.path, '../database.db');

    // Verifica se o arquivo do banco de dados existe
    if (!File(dbPath).existsSync()) {
      print('Banco de dados não encontrado.\n Criando um novo banco de dados...\n');
      _database = sqlite3.open(dbPath);
      _initDatabase();
    } else {
      print('Banco de dados encontrado.\n Conectando...\n');
      _database = sqlite3.open(dbPath);
    }

    return _database!;
  }

  void _initDatabase() {
    _database!.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username CHAR(65) NOT NULL,
        hashes CHAR(65) NOT NULL
      )
    ''');
    print('\nTabelas "users" criadas.\n');
    
    _database!.execute('''
      CREATE TABLE cars (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id INTEGER NOT NULL,
        model CHAR(65) NOT NULL,
        buying CHAR(20) NOT NULL,
        maint CHAR(20) NOT NULL,
        doors CHAR(10) NOT NULL,
        persons CHAR(10) NOT NULL,
        lug_boot CHAR(20) NOT NULL,
        safety CHAR(20) NOT NULL,
        class CHAR(20) NOT NULL,
        FOREIGN KEY (user_id) REFERENCES users (id)
      )
    ''');
    print('\nTabelas "cars" criada.\n');
    print('\nBanco de dados criado.\n');
  }
}