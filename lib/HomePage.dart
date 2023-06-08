import 'package:flutter/material.dart';
import 'NewRegistrationPage.dart';
import 'DatabaseHelper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> _notes = [];

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    final notes = await DatabaseHelper.getNotes();
    setState(() {
      _notes = notes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          SizedBox(height: 20.0),
          Text(
            '一覧',
            style: TextStyle(fontSize: 18.0),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 30.0),
              ElevatedButton(
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewRegistrationPage()),
                  );

                  if (result != null && result) {
                    _loadNotes();
                  }
                },
                child: Text('新規登録'),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Expanded(
            child: _buildNoteList(),
          ),
        ],
      ),
    );
  }

  Widget _buildNoteList() {
    if (_notes.isEmpty) {
      return Center(
        child: Text('データがありません'),
      );
    } else {
      return ListView.builder(
        itemCount: _notes.length,
        itemBuilder: (context, index) {
          final note = _notes[index];
          return ListTile(
            title: Text(note['songTitle']),
            subtitle: Text(note['artistName']),
            trailing: Text(note['score'].toString()),
          );
        },
      );
    }
  }
}
