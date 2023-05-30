import 'package:applicationproduction/search_bar.dart';
import 'package:flutter/material.dart';
//import 'package:original_widget_sample/contents_widget.dart';

void main() => runApp(MyApp());

/*
void main() {
  runApp(const MyApp());
}
*/
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'アプリ名を入れる',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('カラオケ点数記録アプリ'),
        ),
        /*
        body: Center(
          child: Text('一覧'),
        ),
        */
        /*
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        */
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [SearchBarWidget()],
      ),
    );
  }
}
