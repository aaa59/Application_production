/*
import 'package:sqflite/sqflite.dart';

final Future database = openDatabase(
   join(await getDatabasesPath(), 'note_database.db'),
   onCreate: (db, version) {
     return db.execute(
       "CREATE TABLE note(id INTEGER PRIMARY KEY, text TEXT, priority INTEGER)",
     );
   },
   version: 1,
 );
 */