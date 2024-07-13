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
      version: 2, // Increment the version number
      onCreate: _onCreate,
      onUpgrade: _onUpgrade, // Add this line to handle upgrades
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

    await db.execute(
      'CREATE TABLE shops ('
      'id INTEGER PRIMARY KEY AUTOINCREMENT, '
      'shop TEXT, '
      'inuse TEXT'
      ')',
    );
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute(
        'CREATE TABLE shops ('
        'id INTEGER PRIMARY KEY AUTOINCREMENT, '
        'shop TEXT, '
        'inuse TEXT'
        ')',
      );
    }
  }
}
