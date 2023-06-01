import 'package:flutter/material.dart';
//import 'FirstPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("点数リスト"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: '検索キーワードを入力してください',
              ),
            ),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              // 検索ボタンが押されたときの処理
              // ここに検索のロジックを追加してください
            },
            child: Text('検索'),
          ),
        ],
      ),
    );
  }
}
