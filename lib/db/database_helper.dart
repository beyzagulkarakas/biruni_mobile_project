import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class DatabaseHelper {
  static Database? _database;

  // Veritabanı bağlantısını oluştur
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDatabase();
      return _database!;
    }
  }

  // Veritabanını başlat
  _initDatabase() async {
    String path = join(await getDatabasesPath(),
        'biruni_app.db'); // Veritabanı adını burada belirliyoruz
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  // Veritabanı oluşturulurken çağrılan fonksiyon
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE announcements (
        announcement_id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        content TEXT NOT NULL,
        date TEXT NOT NULL
      )
    ''');
  }
}
