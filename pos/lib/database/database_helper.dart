// lib/database/database_helper.dart

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  late Database _database; // Use `late` to indicate it will be initialized later

  DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'user_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE user ('
      'id INTEGER PRIMARY KEY AUTOINCREMENT, '
      'userId TEXT, '
      'deviceId TEXT, '
      'sha TEXT, '
      'token TEXT, '
      'expiry TEXT, '
      'refreshToken TEXT'
      ')',
    );
  }
}
