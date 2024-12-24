import 'dart:io';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String dbPath = join(await getDatabasesPath(), 'Biruni_AppDB.db');

    // Eğer veritabanı yoksa, assets klasöründen kopyala
    bool dbExists = await File(dbPath).exists();
    if (!dbExists) {
      print("Veritabanı bulunamadı. Assets'ten kopyalanıyor...");
      try {
        ByteData data = await rootBundle.load('assets/Biruni_AppDB.db'); // pubspec.yaml'de tanımlı olmalı
        List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
        await File(dbPath).writeAsBytes(bytes);
        print("Veritabanı kopyalandı.");
      } catch (e) {
        print("Veritabanı kopyalanırken bir hata oluştu: $e");
      }
    } else {
      print("Veritabanı bulundu.");
    }

    return await openDatabase(
      dbPath,
      version: 1,
      onOpen: (db) {
        print("Veritabanı açıldı.");
      },
    );
  }

  Future<List<Map<String, dynamic>>> getAnnouncements() async {
    final db = await database;
    return await db.query('announcements');
  }

  Future<List<Map<String, dynamic>>> getAcademicCalendar() async {
    final db = await database;
    return await db.query('academic_calendar');
  }

  Future<List<Map<String, dynamic>>> getCampuses() async {
    final db = await database;
    return await db.query('campuses');
  }

  Future<List<Map<String, dynamic>>> getGrades() async {
    final db = await database;
    return await db.query('grades');
  }

  Future<List<Map<String, dynamic>>> getCourses() async {
    final db = await database;
    return await db.query('courses');
  }
}