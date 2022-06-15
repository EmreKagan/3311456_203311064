
import 'package:flutter/material.dart';

Future Loading(context){
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context)=>Center(child: CircularProgressIndicator(),
      ));
}