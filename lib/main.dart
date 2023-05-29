import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'アプリ名',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('カラオケ点数記録アプリ'),
        ),
        body: Center(
          child: Text('一覧'),
        ),

        /*
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        */
        //次のテキストを入れる場所
      ),
      //次のテキストを入れる場所
    );
  }
}
