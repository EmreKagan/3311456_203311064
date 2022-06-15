import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Pages/mainpage.dart';

Widget MainDrawer(context, ){
  final currentUser = FirebaseAuth.instance.currentUser;
  final togmail = currentUser!.email;
  final toglist = togmail!.split("@");
  final username = toglist[0].toString().toLowerCase();
  return Drawer(
    backgroundColor: Colors.white.withOpacity(0.3),
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [

        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Container(height:250,width:250,child: CircleAvatar(backgroundImage: AssetImage("assets/Images/applogo.png"),)),
            ),

            Text("${username.toUpperCase()}", style: TextStyle(fontSize: 30),),

            SizedBox(height: 50,),

            ListTile(
              title: Text("MainPage"),
              leading: Icon(FontAwesomeIcons.house,),
              tileColor: Colors.orange.withOpacity(0.3),
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage())),
            ),

            ListTile(
              title: Text("Log-Out"),
              leading: Icon(FontAwesomeIcons.powerOff,),
              tileColor: Colors.teal.withOpacity(0.3),
              onTap: ()=>FirebaseAuth.instance.signOut(),
            ),
          ],
        )
      ],
    ),
  );
}

ListTile DrawerElement({text : "Title", icon : Icons.all_inclusive, color : Colors.red, func}){
  return ListTile(
    title: Text("$text"),
    leading: Icon(icon),
    tileColor: color,
    onTap: (){if(func != null){func;};},
  );
}