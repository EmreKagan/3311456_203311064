import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'container_decoration.dart';

Widget ConstTextField(
    margin,
    {
      controller,
      hinttext,
      iscenter = false,
      autoFocus = false,
      inputFormatters,
      maxline = 1,
      ispassword = false,
      showpassword = false,
    }){
  return Container(
    decoration: ConstDecoration(
      radiuscondition: true,
      radius: 30,
      color: Colors.white
    ),
    margin: margin,
    child: TextField(
      controller: controller,
      obscureText: ispassword != false ? !showpassword : showpassword,
      inputFormatters:
      [inputFormatters != null ? inputFormatters : FilteringTextInputFormatter(RegExp("r[]"), allow: false)],

      textAlign: iscenter != false ? TextAlign.center : TextAlign.left,
      keyboardType: TextInputType.multiline ,
      maxLines: maxline,
      autofocus: autoFocus,

      decoration: InputDecoration(
        hintText: hinttext,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30)
        )
      ),
    ),
  );
}

Widget ConstTextFormField({TextEditingController? controller,String? labelT,bool? obscure = false, validate}){
  return Container(
      height: 60,
      width: 240,
      child: TextFormField(
          style: TextStyle(fontSize: 14),
          controller: controller as TextEditingController,
          textInputAction: TextInputAction.next,
          obscureText: obscure as bool,
          decoration: InputDecoration(labelText: "${labelT.toString()}",border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30)
          ),filled: true,fillColor: Colors.white,),
          autovalidateMode:
          AutovalidateMode.onUserInteraction,
          validator: validate));
}