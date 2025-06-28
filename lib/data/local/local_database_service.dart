import 'package:restaurant_app/data/model/restaurant_detail_model/restaurant_detail_model.dart';
import 'package:restaurant_app/data/model/restaurant_list_model/restaurant_model.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabaseService {
  static const String _databaseName = 'restaurant-app1.db';
  static const String _tableName = 'restaurant';
  static const int _version = 4;

  Future<void> createTables(Database database) async {
    await database.execute("""CREATE TABLE $_tableName(
        id TEXT PRIMARY KEY,
        name TEXT,
        description TEXT,
        pictureId TEXT,
        city TEXT,
        address TEXT,
        rating REAL
      )""");
  }

  Future<Database> _initializeDb() async {
    return openDatabase(
      _databaseName,
      version: _version,
      onCreate: (Database database, int version) async {
        await createTables(database);
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        // Hapus tabel lama (opsional, jika mau rebuild)
        await db.execute('DROP TABLE IF EXISTS $_tableName');
        // Buat ulang
        await createTables(db);
      },
    );
  }

  Future<int> insertItem(RestaurantDetailModel restaurant) async {
    final db = await _initializeDb();

    final data = restaurant.toDbJson();
    final id = await db.insert(
      _tableName,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print("SAVED TO DB: $data");
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
