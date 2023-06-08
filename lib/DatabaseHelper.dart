import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Future<Database> _openDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'note_database.db');
    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE note(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          songTitle TEXT,
          artistName TEXT,
          score REAL
        )
      ''');
    });
  }

  static Future<void> insertNote(
      String songTitle, String artistName, double score) async {
    final database = await _openDatabase();
    await database.insert(
      'note',
      {
        'songTitle': songTitle,
        'artistName': artistName,
        'score': score,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getNotes() async {
    final database = await _openDatabase();
    return database.query('note');
  }

  static Future<void> deleteNote(int id) async {
    final database = await _openDatabase();
    await database.delete('note', where: 'id = ?', whereArgs: [id]);
  }
}
