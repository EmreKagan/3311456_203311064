import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'container_decoration.dart';


Widget MenuCard(BuildContext context, {

  splashcolor = Colors.pink,
  containercolor,
  text,
  icon = Icons.account_circle,
  page,
  func
}) {
  return Container(
     //decoration: ConstDecoration(color: Colors.white, radiuscondition: true, radius: 60),
    margin: EdgeInsets.all(10),
      child: Card(
    child: InkWell(
            splashColor: splashcolor.withAlpha(400),
            onTap: page != null ? (){Navigator.push(context, MaterialPageRoute(builder: (context) => page));func;} : null,
            child: Container(

              margin: EdgeInsets.all(20),
              decoration: ConstDecoration(
                  color: containercolor, radiuscondition: true, radius: 60),
              height: 200,
              width: 160,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    icon,
                    size: 90,
                  ),
                  Text("$text", style: TextStyle(fontSize: 30),)
                ],
              )
            ),
          )
  ));
}
