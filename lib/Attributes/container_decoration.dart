import 'package:flutter/material.dart';

BoxDecoration ConstDecoration({color = Colors.redAccent, radius, radiuscondition = false, opacity, opacitycondition = false}){
  return BoxDecoration(
        borderRadius: radiuscondition != false ? BorderRadius.all(Radius.circular(radius)) : null,
        color: opacitycondition != false ? color.withOpacity(opacity) : color,
  );
}