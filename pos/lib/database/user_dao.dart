// lib/database/user_dao.dart

import 'package:sqflite/sqflite.dart';

import 'database_helper.dart';
import 'user.dart';

class UserDao {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  // Insert a user into the database
  Future<void> insertUser(User user) async {
    final db = await _databaseHelper.database;
    await db.insert(
      'user',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve the first user from the database
  Future<User?> getUser() async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('user');
    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    } else {
      return null;
    }
  }

  // Update a user in the database
  Future<void> updateUser(User user) async {
    final db = await _databaseHelper.database;
    await db.update(
      'user',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  // Delete a user from the database
  Future<void> deleteUser(int id) async {
    final db = await _databaseHelper.database;
    await db.delete(
      'user',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
