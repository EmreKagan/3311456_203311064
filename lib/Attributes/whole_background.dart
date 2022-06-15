import 'package:flutter/material.dart';

Container BackG({child}) {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
          image: AssetImage("assets/Images/background.jpg"),
          fit: BoxFit.cover),),
    constraints: const BoxConstraints.expand(),
    child: child,
  );
}