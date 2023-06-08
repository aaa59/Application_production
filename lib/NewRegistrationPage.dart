import 'HomePage.dart';
import 'package:flutter/material.dart';
import 'package:applicationproduction/DatabaseHelper.dart';

class NewRegistrationPage extends StatelessWidget {
  final TextEditingController _songTitleController = TextEditingController();
  final TextEditingController _artistNameController = TextEditingController();
  final TextEditingController _scoreController = TextEditingController();

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
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context, false);
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
                      final score = double.tryParse(_scoreController.text);

                      if (songTitle.isNotEmpty &&
                          artistName.isNotEmpty &&
                          score != null) {
                        DatabaseHelper.insertNote(songTitle, artistName, score);

                        Navigator.pop(context, true);
                      }
                    },
                    child: Text('登録'),
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