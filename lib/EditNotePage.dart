import 'package:flutter/material.dart';
import 'package:applicationproduction/DatabaseHelper.dart';

class EditNotePage extends StatefulWidget {
  final int id;

  const EditNotePage({required this.id});

  @override
  _EditNotePageState createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  final TextEditingController _songTitleController = TextEditingController();
  final TextEditingController _artistNameController = TextEditingController();
  final TextEditingController _scoreController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadNote();
  }

  Future<void> _loadNote() async {
    final note = await DatabaseHelper.getNoteById(widget.id);
    _songTitleController.text = note['songTitle'];
    _artistNameController.text = note['artistName'];
    _scoreController.text = note['score'].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('データ編集'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16.0),
            TextFormField(
              controller: _songTitleController,
              decoration: InputDecoration(
                labelText: '曲名',
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _artistNameController,
              decoration: InputDecoration(
                labelText: 'アーティスト名',
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _scoreController,
              decoration: InputDecoration(
                labelText: '点数',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 32.0),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context, false); // falseを渡す
                    },
                    child: Text(
                      'キャンセル',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      final songTitle = _songTitleController.text;
                      final artistName = _artistNameController.text;
                      final score = int.tryParse(_scoreController.text);

                      if (songTitle.isNotEmpty &&
                          artistName.isNotEmpty &&
                          score != null) {
                        DatabaseHelper.updateNote(
                            widget.id, songTitle, artistName, score);

                        Navigator.pop(context, true); // trueを渡す
                      }
                    },
                    child: Text('保存'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
