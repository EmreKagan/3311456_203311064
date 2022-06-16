import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:updapp/Attributes/main_drawer.dart';
import 'package:updapp/Attributes/whole_background.dart';
import 'package:updapp/Widgets/Pages/gesture_page.dart';
import 'dart:io';

class Gestures extends StatefulWidget {
  const Gestures({Key? key}) : super(key: key);
  @override
  State<Gestures> createState() => _GesturesState();
}

class _GesturesState extends State<Gestures> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.deepPurple.withOpacity(0.6),),
        drawer: MainDrawer(context),
        body: BackG(
          child: Container(
            color: Colors.white,
            margin: EdgeInsets.all(30),
            child: FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [

                      Divider(),
                      GestureDetector(
                        onTap: () async {Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => GesturePage(text: "Bir kere basıldı...",)));
                        await Future.delayed(Duration(seconds: 2));
                            Navigator.pop(context);
                            },

                        child: Container(
                          color: Colors.red,
                          child: Text("One Tap",style: TextStyle(fontSize: 5),),
                       ),),

                      Divider(),
                      GestureDetector(
                        onDoubleTap: () async {Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => GesturePage(text: "İkili tıklama...",)));
                        await Future.delayed(Duration(seconds: 2));
                        Navigator.pop(context);
                          },
                        child: Container(
                          color: Colors.cyan,
                          child: Text("Double Tap",style: TextStyle(fontSize: 5),),
                        ),),

                      Divider(),
                      GestureDetector(
                        onLongPress: ()async{Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => GesturePage(text: "Uzun basma...",)));
                        await Future.delayed(Duration(seconds: 2));
                        Navigator.pop(context);
                          },
                        child: Container(
                          color: Colors.green,
                          child: Text("Long Press",style: TextStyle(fontSize: 5),),
                        ),),

                      Divider(),
                      GestureDetector(
                        onHorizontalDragUpdate: (details)async{Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=> GesturePage(text: "Y ekseninde sürüklendi...",)));
                        await Future.delayed(Duration(seconds: 2));
                        Navigator.pop(context);
                          },
                        child: Container(
                          color: Colors.purpleAccent,
                          child: Text("Veritcal Drag",style: TextStyle(fontSize: 5),),
                        ),),

                      Divider(),
                      GestureDetector(
                        onVerticalDragUpdate: (details) async {Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => GesturePage(text: "X ekseninde sürüklendi...",)));
                        await Future.delayed(Duration(seconds: 2));
                        Navigator.pop(context);
                          },
                        child: Container(
                          color: Colors.orange,
                          child: Text("Horizontal Drag",style: TextStyle(fontSize: 5),),
                        ),),
                      Divider(),
                    ],
                  ),

                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}
