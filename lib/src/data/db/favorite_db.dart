import 'package:foodyar_final/src/data/models/restaurant.dart';
import 'package:sqflite/sqflite.dart';

class FavoriteDatabase {
  static FavoriteDatabase? _instance;
  static Database? _database;

  FavoriteDatabase._internal() {
    _instance = this;
  }

  factory FavoriteDatabase() => _instance ?? FavoriteDatabase._internal();
  static const String _tbFavorite = 'favorite';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      '$path/foodyar_final.db',
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $_tbFavorite(
          id TEXT PRIMARY KEY,
          name TEXT,
          description TEXT,
          pictureId TEXT,
          city TEXT,
          rating DOUBLE
        )
        ''');
      },
      version: 1,
    );
    return db;
  }

  Future<Database?> get database async {
    _database ??= await _initializeDb();
    return _database;
  }

  Future<void> insertFavorite(Restaurant restaurant) async {
    final db = await database;
    await db!.insert(_tbFavorite, restaurant.toJson());
  }

  Future<List<Restaurant>> getFavorite() async {
    final db = await database;
    List<Map<String, dynamic>> result = await db!.query(_tbFavorite);
    return result.map((e) => Restaurant.fromJson(e)).toList();
  }

  Future<Map> getFavoriteById(String id) async {
    final db = await database;
    List<Map<String, dynamic>> results =
    await db!.query(_tbFavorite, where: 'id = ?', whereArgs: [id]);
    if (results.isNotEmpty) {
      return results.first;
    } else {
      return {};
    }
  }

  Future<void> removeFavorite(String id) async {
    final db = await database;
    await db!.delete(
      _tbFavorite,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}