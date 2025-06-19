import 'package:restaurant_app/data/model/restaurant_list_model/restaurant_model.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabaseService {
  static const String _databaseName = 'restaurant-app.db';
  static const String _tableName = 'tourism';
  static const int _version = 1;

  Future<void> createTables(Database database) async {
    await database.execute("""CREATE TABLE $_tableName(
        id TEXT PRIMARY KEY,
        name TEXT,
        description TEXT,
        pictureId TEXT,
        city TEXT,
        rating TEXT
      )""");
  }

  Future<Database> _initializeDb() async {
    return openDatabase(
      _databaseName,
      version: _version,
      onCreate: (Database database, int version) async {
        await createTables(database);
      },
    );
  }

  Future<int> insertItem(RestaurantModel restaurant) async {
    final db = await _initializeDb();

    final data = restaurant.toJson();
    final id = await db.insert(
      _tableName,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id;
  }

  Future<RestaurantModel?> getItemById(String id) async {
    final db = await _initializeDb();
    final result = await db.query(
      _tableName,
      where: "id = ?",
      whereArgs: [id],
      limit: 1,
    );

    return result.isEmpty ? null : RestaurantModel.fromJson(result.first);
  }

  Future<List<RestaurantModel>> getAllItems() async {
   final db = await _initializeDb();
   final results = await db.query(_tableName);
 
   return results.map((result) => RestaurantModel.fromJson(result)).toList();
 }

  Future<int> removeItem(String id) async {
    final db = await _initializeDb();

    final result = await db.delete(
      _tableName,
      where: "id = ?",
      whereArgs: [id],
    );
    return result;
  }
}
