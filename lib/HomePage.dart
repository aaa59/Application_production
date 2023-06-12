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

    return ListView.builder(
      itemCount: resultList.length,
      itemBuilder: (context, index) {
        final note = resultList[index];
        return Dismissible(
          key: Key(note['id'].toString()),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) async {
            await DatabaseHelper.deleteNote(note['id']);
            setState(() {
              resultList.removeAt(index);
            });
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
          child: ListTile(
            title: Text(note['songTitle']),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(note['artistName']),
                SizedBox(height: 4.0),
                Text(
                  '日付: ${DateTime.parse(note['date']).year}/${DateTime.parse(note['date']).month}/${DateTime.parse(note['date']).day}',
                  style: TextStyle(fontSize: 12.0),
                ),
              ],
            ),
            trailing: Text(note['score'].toStringAsFixed(3)),
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditNotePage(note: note)),
              );

              if (result != null && result) {
                _loadNotes();
              }
            },
          ),
        );
      },
    );
  }
}