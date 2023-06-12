import 'HomePage.dart';
import 'package:flutter/material.dart';
import 'DatabaseHelper.dart';

class NewRegistrationPage extends StatefulWidget {
  @override
  _NewRegistrationPageState createState() => _NewRegistrationPageState();
}

class _NewRegistrationPageState extends State<NewRegistrationPage> {
  final TextEditingController _songTitleController = TextEditingController();
  final TextEditingController _artistNameController = TextEditingController();
  final TextEditingController _scoreController = TextEditingController();
<<<<<<< HEAD
  bool _canAddNote = false;
  String? _scoreErrorText;
=======
<<<<<<< HEAD
  bool _canAddNote = false;
  String? _scoreErrorText;
=======
  DateTime _selectedDate = DateTime.now();

  @override
  void dispose() {
    _songTitleController.dispose();
    _artistNameController.dispose();
    _scoreController.dispose();
    super.dispose();
  }
>>>>>>> b52bb8db1d12d85d0c194e033a2509de5618e81d
>>>>>>> aad984c25dadeca525eec2866e5b1fe665eec1b7

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
        title: Text('新規登録'),
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
                errorText: _scoreErrorText,
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  if (value == null || value.isEmpty) {
                    _canAddNote = false;
                    _scoreErrorText = '点数を入力してください';
                  } else {
                    final score = double.tryParse(value);
                    if (score == null || score < 0.0 || score > 100.0) {
                      _canAddNote = false;
                      _scoreErrorText = '有効な点数を入力してください (0.0 - 100.0)';
                    } else {
                      _canAddNote = true;
                      _scoreErrorText = null;
                    }
                  }
                });
              },
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
<<<<<<< HEAD
              onPressed: _canAddNote
                  ? () async {
=======
<<<<<<< HEAD
              onPressed: _canAddNote
                  ? () async {
=======
              onPressed: () async {
>>>>>>> b52bb8db1d12d85d0c194e033a2509de5618e81d
>>>>>>> aad984c25dadeca525eec2866e5b1fe665eec1b7
                final songTitle = _songTitleController.text;
                final artistName = _artistNameController.text;
                final score = double.tryParse(_scoreController.text);
                final date = DateTime.now().toString();

<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> b52bb8db1d12d85d0c194e033a2509de5618e81d
>>>>>>> aad984c25dadeca525eec2866e5b1fe665eec1b7
                if (songTitle.isNotEmpty &&
                    artistName.isNotEmpty &&
                    score != null) {
                  await DatabaseHelper.insertNote(
                    songTitle,
                    artistName,
                    score,
                    date,
                  );
                  Navigator.pop(context, true);
                }
<<<<<<< HEAD
              }
                  : null,
              child: Text('登録'),
=======
<<<<<<< HEAD
              }
                  : null,
              child: Text('登録'),
=======
              },
              child: Text('登録'),
=======
                      if (songTitle.isNotEmpty &&
                          artistName.isNotEmpty &&
                          score != null) {
                        final date = DateTime.now().toString();

                        DatabaseHelper.insertNote(
                          songTitle,
                          artistName,
                          score,
                          date,
                        );
                        Navigator.pop(context, true);
                      }
                    },
                    child: Text('登録'),
                  ),
                ),
              ],
>>>>>>> 4891047ebfcb3681d0448a16ac1d893e507e1ec9
>>>>>>> b52bb8db1d12d85d0c194e033a2509de5618e81d
>>>>>>> aad984c25dadeca525eec2866e5b1fe665eec1b7
            ),
          ],
        ),
      ),
    );
  }
}
