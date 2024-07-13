// lib/database/shop_dao.dart

import 'package:sqflite/sqflite.dart';

import 'database_helper.dart';
import 'shop.dart';

class ShopDao {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  // Insert a shop into the database
  Future<void> insertShop(Shop shop) async {
    final db = await _databaseHelper.database;
    await db.insert(
      'shops',
      shop.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve all shops from the database
  Future<List<Shop>> getShops() async {
    final db = await _databaseHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('shops');

    return List.generate(maps.length, (i) {
      return Shop.fromMap(maps[i]);
    });
  }

  // Update a shop in the database
  Future<void> updateShop(Shop shop) async {
    final db = await _databaseHelper.database;
    await db.update(
      'shops',
      shop.toMap(),
      where: 'id = ?',
      whereArgs: [shop.id],
    );
  }

  // Delete a shop from the database
  Future<void> deleteShop(int id) async {
    final db = await _databaseHelper.database;
    await db.delete(
      'shops',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
