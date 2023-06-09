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
  bool _canUpdateNote = true;
  String? _scoreErrorText;

  @override
  void initState() {
    super.initState();
    _songTitleController.text = widget.note['songTitle'];
    _artistNameController.text = widget.note['artistName'];

    // 点数の表示を調整
    _scoreController.text = widget.note['score'].toStringAsFixed(3);
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
      body: SingleChildScrollView( // SingleChildScrollViewを追加
        child: Padding(
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
                  errorText: _scoreErrorText,
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    if (value == null || value.isEmpty) {
                      _canUpdateNote = false;
                      _scoreErrorText = '点数を入力してください';
                    } else {
                      final score = double.tryParse(value);
                      if (score == null || score < 0.0 || score > 100.0) {
                        _canUpdateNote = false;
                        _scoreErrorText = '有効な点数を入力してください (0.0 - 100.0)';
                      } else {
                        _canUpdateNote = true;
                        _scoreErrorText = null;
                      }
                    }
                  });
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _canUpdateNote
                    ? () async {
                  final songTitle = _songTitleController.text;
                  final artistName = _artistNameController.text;
                  final score = double.tryParse(_scoreController.text);

                  if (songTitle.isNotEmpty &&
                      artistName.isNotEmpty &&
                      score != null) {
                    await DatabaseHelper.updateNote(
                      widget.note['id'],
                      songTitle,
                      artistName,
                      score,
                    );
                    Navigator.pop(context, true);
                  }
                }
                    : null,
                child: Text('更新'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
