import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });
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
/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    */
  }
}
