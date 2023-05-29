import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TextField(
          decoration: InputDecoration(
            labelText: '曲名 又は アーティスト名 を入力',
            prefixIcon: Icon(Icons.search),
          ),
        ),
        SizedBox(
          //フィールドとボタンの間にスペースを作成
          TextButton(
            onPressed: () {
              //検索ボタンが押された時の処理
              //検索ロジックを追加する
            },
            child: Text('検索'),
          ),
        ),
      ),
    );

    /*
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      child: Container(
        height: 400,
        color: const Color.fromARGB(255, 255, 0, 25),
        child: const Center(
          child: Text('メイン画像'),
        ),
      ),
    );
  }
  */
  }
}
