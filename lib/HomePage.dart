import 'package:flutter/material.dart';
import 'NewRegistrationPage.dart';
//import 'package:sqflite/sqflite.dart';
//import 'package:path/path.dart';
//import 'FirstPage.dart';

class HomePage extends StatelessWidget {
  /*
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
  */

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('点数確認画面'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: '曲名 か アーティスト名を入力',
                      ),
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // 検索ボタンが押された時の処理
                    // ここに検索のロジックを書く
                  },
                  icon: Icon(Icons.search),
                  label: Text('検索'),
                ),
              ],
            ),
            SizedBox(height: 20.0), // テキストとの間に余白を設定
            Text(
              '一覧',
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0), // テキストとボタンの間に余白を設定
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 30.0), // ボタンの左側に余白を設定
                ElevatedButton(
                  onPressed: () {
                    // 新規登録ボタンが押された時の処理
                    // ここに新規登録のロジックを書く
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewRegistrationPage()),
                    );
                  },
                  child: Text('新規登録'),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    /*
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('点数確認画面'),
        ),
        body: Center(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '曲名 か アーティスト名を入力',
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // 検索ボタンが押された時の処理
                  // ここに検索のロジックを書く
                },
                child: Text('検索'),
              ),
            ],
          ),
        ),
      ),
    );
    */
  }
}
