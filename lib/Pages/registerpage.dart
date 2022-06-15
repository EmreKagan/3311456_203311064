import 'package:flutter/material.dart';
import '../Widgets/Pages/registerpage_widget.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(theme: ThemeData.light(), home: RegisterPageUI());
  }
}
