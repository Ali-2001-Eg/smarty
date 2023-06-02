import 'package:flutter/material.dart';

class GameItems extends StatelessWidget {
  final String? imagePath;
  final String? title;
  final String? gameUrl;
  final bool isMathGame;
  const GameItems(
      {this.imagePath,
      this.title,
      this.gameUrl,
      Key? key,
      this.isMathGame = true})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
