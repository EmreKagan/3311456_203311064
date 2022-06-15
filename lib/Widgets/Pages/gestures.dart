import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:updapp/Attributes/main_drawer.dart';
import 'package:updapp/Attributes/whole_background.dart';

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
        drawer: MainDrawer(context),
        appBar: AppBar(backgroundColor: Colors.deepPurple.withOpacity(0.6),),
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
                        onTap: (){
                          print("Gulugulu");
                        },
                        child: Container(
                          color: Colors.red,
                          child: Text("One Tap",style: TextStyle(fontSize: 5),),
                        ),),
                      Divider(),
                      GestureDetector(
                        onDoubleTap: (){
                          setState(() {
                            print("Daha cok gulu");
                          });
                        },
                        child: Container(
                          color: Colors.cyan,
                          child: Text("Double Tap",style: TextStyle(fontSize: 5),),
                        ),),
                      Divider(),
                      GestureDetector(
                        onLongPress: (){
                          setState(() {
                            print("Uzuuuuun gulugulu");
                          });
                        },
                        child: Container(
                          color: Colors.green,
                          child: Text("Long Press",style: TextStyle(fontSize: 5),),
                        ),),
                      Divider(),
                      GestureDetector(
                        onHorizontalDragUpdate: (details){
                          setState(() {
                            print("Dikey gulugulu");
                          });
                        },
                        child: Container(
                          color: Colors.purpleAccent,
                          child: Text("Veritcal Drag",style: TextStyle(fontSize: 5),),
                        ),),
                      Divider(),
                      GestureDetector(
                        onVerticalDragUpdate: (details){
                          setState(() {
                            print("Yatay gulugulu");
                          });
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
