import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
//import 'NewRegistrationPage.dart';
//import 'package:original_widget_sample/contents_widget.dart';

//void main() => runApp(MyApp());

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key});

  Future<void> _openDatabase() async {
    final database = await openDatabase(
      join(await getDatabasesPath(), 'note_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE note(id INTEGER PRIMARY KEY AUTOINCREMENT,songTitle TEXT,artistName TEXT,score INTEGER)",
        );
      },
      version: 1,
    );
    // データベースの操作などを行う...
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'アプリ名を入れる',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class DatabaseHelper {
  static Future<Database> database() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'note_database.db');

    return openDatabase(path, version: 1, onCreate: (db, version) {
      db.execute(
        "CREATE TABLE note(id INTEGER PRIMARY KEY AUTOINCREMENT,songTitle TEXT,artistName TEXT,score INTEGER)",
      );
    });
  }

  static Future<void> insertNote(
      String songTitle, String artistName, int score) async {
    final db = await database();
    await db.insert(
      'note',
      {
        'songTitle': songTitle,
        'artistName': artistName,
        'score': score,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
