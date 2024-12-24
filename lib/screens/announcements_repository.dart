import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AnnouncementsRepository {
  // Veritabanı bağlantısını açar
  Future<Database> _getDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'BiruniAppDB.db');
    return openDatabase(path);
  }

  // Duyuruları alır
  Future<List<Map<String, dynamic>>> getAnnouncements() async {
    final db = await _getDatabase();
    return db.query('announcements');
  }
}
