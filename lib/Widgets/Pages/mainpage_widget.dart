import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:updapp/Pages/adminpanel_doc.dart';
import 'package:updapp/WeatherApp/weather.dart';
import 'package:updapp/Widgets/Pages/gestures.dart';
import '../../Attributes/container_decoration.dart';
import '../../Attributes/menu_card.dart';
import '../../Attributes/whole_background.dart';
import '../../Pages/saves.dart';
import '../../Pages/textwrite.dart';
import '../../Attributes/main_drawer.dart';

class MainPageUI extends StatefulWidget {
  const MainPageUI({Key? key}) : super(key: key);

  @override
  State<MainPageUI> createState() => _MainPageUIState();
}

class _MainPageUIState extends State<MainPageUI> {
  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(backgroundColor: Colors.deepPurple.withOpacity(0.6),),
          drawer: MainDrawer(context),
          body: BackG(
              child: Center(
                  child: FittedBox(
                      child: Column(
            children: [
              Container(
                  decoration: ConstDecoration(
                      radiuscondition: true,
                      radius: 30,
                      opacitycondition: true,
                      opacity: 0.6),
                  constraints: BoxConstraints(maxWidth: double.infinity),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: DefaultTextStyle(
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            child: AnimatedTextKit(
                              animatedTexts: [WavyAnimatedText("WELCOME!")],
                              repeatForever: true,
                              isRepeatingAnimation: true,
                            ),
                          ),
                          //margin: EdgeInsets.all(10),
                          //constraints: const BoxConstraints.expand(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            MenuCard(context,
                                containercolor: Colors.amber,
                                splashcolor: Colors.purpleAccent,
                                icon: Icons.save,
                                page: Saves(),
                                text: "Saves"),

                            MenuCard(context,
                            containercolor: Colors.amber,
                              splashcolor: Colors.pinkAccent,
                              icon: FontAwesomeIcons.cloud,
                              page: Weather(),
                              text: "Hava"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            (currentUser?.uid == "c9Drya1vYyaxhAofhG3fSMAwg543")?
                            (MenuCard(context,
                                containercolor: Colors.deepOrange,
                                splashcolor: Colors.amber,
                                icon: FontAwesomeIcons.user,
                                page: DocControlPanel(),
                                text: "Control"))

                            :MenuCard(context,
                              containercolor: Colors.amber,
                              splashcolor: Colors.green,
                              icon: FontAwesomeIcons.list,
                              page: Gestures(),
                              text: "Gestures"
                            ),

                            MenuCard(context,
                                containercolor: Colors.amber,
                                splashcolor: Colors.cyan,
                                icon: Icons.add,
                                page: TextPage(),
                                text: "Create"),
                          ],
                        ),
                      ],
                    ),
                  )),
            ],
          ))))),
    );
  }
}
