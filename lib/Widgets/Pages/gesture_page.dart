import 'package:flutter/material.dart';
import 'package:updapp/Attributes/whole_background.dart';

class GesturePage extends StatelessWidget {
  final String? text;
  GesturePage({Key? key,this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BackG(
          child: Container(
            margin: EdgeInsets.all(30),
            child: FittedBox(
              child: Center(
                child: Container(
                    color: Colors.white,
                    child: Text("${text.toString()}"),

                ),
              ),
            ),
          )
        ),
      ),
    );
  }
}
