import 'package:flutter/material.dart';
import '../Widgets/Pages/saves_widget.dart';

class Saves extends StatefulWidget {
  const Saves({Key? key}) : super(key: key);

  @override
  State<Saves> createState() => _SavesState();
}

class _SavesState extends State<Saves> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: SavesPageUI()
    );
  }
}