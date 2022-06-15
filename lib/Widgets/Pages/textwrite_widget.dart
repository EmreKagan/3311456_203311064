import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:updapp/Firestore/send_text_to_firebase.dart';
import 'package:updapp/Attributes/whole_background.dart';
import 'package:updapp/Pages/mainpage.dart';
import 'package:updapp/Pages/saves.dart';
import '../../Attributes/const_text_field.dart';
import '../../Attributes/container_decoration.dart';
import '../../Attributes/main_drawer.dart';
import '../../Pages/textwrite.dart';

class TextPageUI extends StatefulWidget {
  bool edit;
  String? currentID, savedTitle, savedText;
  TextPageUI({
    Key? key,
    this.edit = false,
    this.currentID,
    this.savedTitle,
    this.savedText,

  }) : super(key: key);

  @override
  State<TextPageUI> createState() => _TextPageUIState();
}

class _TextPageUIState extends State<TextPageUI> {

  late TextEditingController _controllerTitle;
  late TextEditingController _controllerText;
  late TextEditingController editTitle;
  late TextEditingController editText;

  @override
  void initState() {
    super.initState();
    _controllerTitle = TextEditingController();
    _controllerText = TextEditingController();
    editTitle = TextEditingController();
    editText = TextEditingController();

    if(widget.edit==true){
      editTitle.text = widget.savedTitle.toString();
      editText.text = widget.savedText.toString();
    };
  }

  @override
  void dispose() {
    _controllerTitle.dispose();
    _controllerText.dispose();
    editTitle.dispose();
    editText.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;
    final docUserUp =FirebaseFirestore.instance
    .collection("usersaves")
    .doc(widget.currentID);
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple.withOpacity(0.6),
            actions: [IconButton(onPressed: (){

              if(widget.edit==false){
                  createFTData(id: currentUser?.uid,text: _controllerText.text, title: _controllerTitle.text);
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>MainPage()));

              }else{
                docUserUp.update({
                  "text" : (editText.text.toString()=="")?"---***---":(editText.text.toString()),
                  "title" : (editTitle.text.toString()=="")?"---***---":(editTitle.text.toString()),
                });
              }

              if(widget.edit==true){Navigator.push(context, MaterialPageRoute(builder: (context) =>Saves()));};

            }, icon: Icon(Icons.save))],),
          drawer: MainDrawer(context),

          body: BackG(
              child: Container(
                decoration: ConstDecoration(
                    radiuscondition: true,
                    radius: 30,
                    opacitycondition: true,
                    opacity: 0.6
                ),
                constraints: const BoxConstraints.expand(),
                margin: EdgeInsets.all(40),
                child: SizedBox(
                  height: 400,
                  child : Column(
                    children: [
                      Flexible(
                        child: ConstTextField(
                            EdgeInsets.fromLTRB(10, 10, 10, 5),
                            controller:
                            widget.edit==false
                            ?(_controllerTitle) : (editTitle),
                            iscenter: true,
                            autoFocus: true,
                            inputFormatters: UpperCaseTextFormatter()
                        ),
                        flex: 1,),



                      Flexible(
                        child: ConstTextField(
                            EdgeInsets.fromLTRB(10, 5, 10, 10),
                            controller:
                            widget.edit==false
                            ?(_controllerText) : (editText),
                            maxline: 200
                        ),
                        flex: 8,)
                    ],
                  ),),)
          )
      ),);
  }
}