import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      child: Container(
        height: 400,
        color: const Color.fromARGB(255, 255, 0, 25),
        child: const Center(
          child: Text('メイン画像'),
        ),
      ),
    );
  }
}
