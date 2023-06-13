import 'package:flutter/material.dart';
import 'DatabaseHelper.dart';
import 'NewRegistrationPage.dart';
import 'EditNotePage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> _notes = [];
  List<Map<String, dynamic>> _searchResults = [];

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    final notes = await DatabaseHelper.getNotes();
    setState(() {
      _notes = List.from(notes.reversed);
    });
  }

  Future<bool?> _confirmDelete(BuildContext context, Map<String, dynamic> note) async {
    return showDialog<bool?>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('削除の確認'),
          content: Text('本当に削除しますか？'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // キャンセルボタンが押された場合はfalseを返す
              },
              child: Text('キャンセル'),
            ),
            TextButton(
              onPressed: () async {
                await DatabaseHelper.deleteNote(note['id']);
                setState(() {
                  _notes.remove(note); // ノートをリストから削除する
                  _searchResults.remove(note); // 検索結果からも削除する
                });
                Navigator.of(context).pop(true); // 削除ボタンが押された場合はtrueを返す
              },
              child: Text('削除'),
            ),
          ],
        );
      },
    );
  }


  Future<void> _searchNotes(String searchText) async {
    final notes = await DatabaseHelper.getNotes();
    final List<Map<String, dynamic>> results = [];

    for (var note in notes) {
      final songTitle = note['songTitle'].toString().toLowerCase();
      final artistName = note['artistName'].toString().toLowerCase();

      if (songTitle.contains(searchText.toLowerCase()) ||
          artistName.contains(searchText.toLowerCase())) {
        results.add(note);
      }
    }

    setState(() {
      _searchResults = results;
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
                    controller: _searchController,
                    onChanged: (value) {
                      _searchNotes(value);
                    },
                    decoration: InputDecoration(
                      hintText: '曲名 か アーティスト名を入力',
                    ),
                  ),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  final searchText = _searchController.text;
                  _searchNotes(searchText);
                },
                icon: Icon(Icons.search),
                label: Text('検索'),
              ),
            ],
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
                    MaterialPageRoute(builder: (context) => NewRegistrationPage()),
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
    final resultList = _searchResults.isNotEmpty ? _searchResults : _notes;

    if (resultList.isEmpty) {
      return Center(
        child: Text('データがありません'),
      );
    }

    return ListView.separated(
      itemCount: resultList.length,
      separatorBuilder: (context, index) => Divider(
        color: Colors.grey,
      ),
      itemBuilder: (context, index) {
        final note = resultList[index];

        final double score = double.parse(note['score'].toString());
        Color scoreColor = Colors.black;
        if (score >= 90.0) {
          scoreColor = Colors.red;
        }

        return Dismissible(
          key: Key(note['id'].toString()),
          direction: DismissDirection.endToStart,
          confirmDismiss: (direction) async {
            final result = await _confirmDelete(context, note);
            return result ?? false;
          },
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          onDismissed: (direction) async {
            await DatabaseHelper.deleteNote(note['id']);
            setState(() {
              resultList.remove(note); // ノートをリストから削除する
            });
          },
          child: ListTile(
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 05ded1306d6295699120a3aca502104c75755ad4
            title: Text(
              note['songTitle'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.black, // 曲名の文字色を黒に設定
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  note['artistName'],
                  style: TextStyle(
                    fontSize: 14.0,
                    fontStyle: FontStyle.italic,
                    color: Colors.blue, // アーティスト名の文字色を青に設定
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  '日付: ${DateTime.parse(note['date']).year}/${DateTime.parse(note['date']).month}/${DateTime.parse(note['date']).day}',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            trailing: Text(
              score.toStringAsFixed(3),
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: scoreColor, // 点数の文字色を設定
              ),
            ),
<<<<<<< HEAD
=======
=======
            title: Text(note['songTitle']),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(note['artistName']),
                SizedBox(height: 4.0),
                Text(
<<<<<<< HEAD
                  '日付: ${DateTime.parse(note['date']).year}/${DateTime.parse(note['date']).month}/${DateTime.parse(note['date']).day}',
=======
<<<<<<< HEAD
                  '日付: ${DateTime.parse(note['date']).year}/${DateTime.parse(note['date']).month}/${DateTime.parse(note['date']).day}',
=======
<<<<<<< HEAD
                  '日付: ${DateTime.parse(note['date']).year}/${DateTime.parse(note['date']).month}/${DateTime.parse(note['date']).day}',
=======
                  '日付: ${note['date']}',
>>>>>>> 4891047ebfcb3681d0448a16ac1d893e507e1ec9
>>>>>>> b52bb8db1d12d85d0c194e033a2509de5618e81d
>>>>>>> aad984c25dadeca525eec2866e5b1fe665eec1b7
                  style: TextStyle(fontSize: 12.0),
                ),
              ],
            ),
            trailing: Text(note['score'].toStringAsFixed(3)),
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> b52bb8db1d12d85d0c194e033a2509de5618e81d
>>>>>>> aad984c25dadeca525eec2866e5b1fe665eec1b7
>>>>>>> df6a5518cea19c86bb43d260dcccc953fbf69109
>>>>>>> 05ded1306d6295699120a3aca502104c75755ad4
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditNotePage(note: note)),
              );

              if (result != null && result) {
                _loadNotes();
              }
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
=======
            onTap: () {
              // リストアイテムがタップされた時の処理を追加する
>>>>>>> 4891047ebfcb3681d0448a16ac1d893e507e1ec9
>>>>>>> b52bb8db1d12d85d0c194e033a2509de5618e81d
>>>>>>> aad984c25dadeca525eec2866e5b1fe665eec1b7
>>>>>>> df6a5518cea19c86bb43d260dcccc953fbf69109
>>>>>>> 05ded1306d6295699120a3aca502104c75755ad4
            },
          ),
        );
      },
    );
  }
}