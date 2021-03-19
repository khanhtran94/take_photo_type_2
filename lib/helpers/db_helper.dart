import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'places.db'),
        onCreate: (db, version) {
      db.execute(
          'CREATE TABLE types (id  INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT,description TEXT)');
      db.execute('CREATE TABLE items (id  TEXT, type_id INTEGER, name TEXT)');
      db.execute('CREATE TABLE image_items (item_id  TEXT, image TEXT)');
    }, version: 1);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();
    return db.insert(table, data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<void> update(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();
    return db.update(table, data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database();

    return db.query(table);
  }
}
