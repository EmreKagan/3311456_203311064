import 'package:flutter/material.dart';
import '../Widgets/Pages/mainpage_widget.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: MainPageUI()
    );
  }
}
