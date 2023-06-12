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
  DateTime _selectedDate = DateTime.now();

  @override
  void dispose() {
    _songTitleController.dispose();
    _artistNameController.dispose();
    _scoreController.dispose();
    super.dispose();
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
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () async {
                final songTitle = _songTitleController.text;
                final artistName = _artistNameController.text;
                final score = double.tryParse(_scoreController.text);
                final date = DateTime.now().toString();

<<<<<<< HEAD
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
            ),
          ],
        ),
      ),
    );
  }
}
