import 'package:flutter/material.dart';
class GameItems extends StatelessWidget {
  final String imagePath;
  final String title;
  final List<String>levelsUrl;
  GameItems(this.imagePath, this.title,this.levelsUrl, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Levels extends StatelessWidget {
  final String levelUrl;
  const Levels({Key? key,required this.levelUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
