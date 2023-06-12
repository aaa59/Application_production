import 'package:flutter/material.dart';
import 'DatabaseHelper.dart';
import 'HomePage.dart';

class EditNotePage extends StatefulWidget {
  final Map<String, dynamic> note;

  EditNotePage({required this.note});

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
    _songTitleController.text = widget.note['songTitle'];
    _artistNameController.text = widget.note['artistName'];
    _scoreController.text = widget.note['score'].toString();
  }

  @override
  void dispose() {
    _songTitleController.dispose();
    _artistNameController.dispose();
    _scoreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('編集'),
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
            ElevatedButton(
              onPressed: () async {
                final songTitle = _songTitleController.text;
                final artistName = _artistNameController.text;
                final score = double.tryParse(_scoreController.text);

                if (songTitle.isNotEmpty &&
                    artistName.isNotEmpty &&
                    score != null) {
                  await DatabaseHelper.updateNote(widget.note['id'], songTitle, artistName, score);
                  Navigator.pop(context, true);
                }
              },
              child: Text('更新'),
            ),
          ],
        ),
      ),
    );
  }
}
