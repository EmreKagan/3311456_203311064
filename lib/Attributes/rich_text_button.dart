import 'package:flutter/material.dart';

TextButton RichTextButton(context, {text, highligthedtext, func, recognizer}){
  return TextButton(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: 15),
      ),
      onPressed: () {
        func;
      },
      child: RichText(
        text: TextSpan(
          text: '$text ',
          style: TextStyle(
            fontSize: 10,
          ),
          children: <TextSpan>[
            TextSpan(
              recognizer: recognizer,
                text: '$highligthedtext',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow,
                    fontStyle: FontStyle.italic)),
          ],
        ),
      ));
}