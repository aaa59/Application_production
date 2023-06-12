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
            SizedBox(height: 16.0),
            Text(
              '日付: ${_selectedDate.year}/${_selectedDate.month}/${_selectedDate.day}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                _selectDate(context);
              },
              child: Text('日付を選択'),
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
                        final date = _selectedDate.toString();

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
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }
}
