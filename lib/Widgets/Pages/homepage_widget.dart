import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../Attributes/const_text_field.dart';
import '../../Attributes/container_decoration.dart';
import '../../Attributes/whole_background.dart';
import '../../Pages/registerpage.dart';

class HomePageUI extends StatefulWidget {
  const HomePageUI({Key? key}) : super(key: key);

  @override
  State<HomePageUI> createState() => _HomePageUIState();
}

class _HomePageUIState extends State<HomePageUI> {
  late TextEditingController _email;
  late TextEditingController _password;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
          body: BackG(
        child: Container(
            decoration: ConstDecoration(
                radiuscondition: true,
                radius: 30,
                opacitycondition: true,
                opacity: 0.6,
                color: Colors.deepPurple),
            constraints: const BoxConstraints.expand(),
            margin: const EdgeInsets.all(20),
            child: FittedBox(
                child: Container(
              margin: const EdgeInsets.fromLTRB(20, 50, 20, 50),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage(
                        "assets/Images/applogo.png",
                      ),
                      radius: 120,
                    ),
                  ),

                  Container(
                    height: 60,
                    width: 240,
                    child: ConstTextField(const EdgeInsets.all(8), controller: _email,
                        iscenter: true, hinttext: "E-Mail"),
                  ),

                  Container(
                    height: 60,
                    width: 240,
                    child: ConstTextField(const EdgeInsets.all(8), controller: _password,
                        iscenter: true, ispassword: true, hinttext: "Şifre"),
                  ),

                  //// FIREBASE AUTH GIRIS
                  Row(children: [
                    Container(
                        margin: const EdgeInsets.all(20),
                        child: FloatingActionButton.extended(
                            backgroundColor: Colors.deepOrangeAccent,
                            icon: const Icon(FontAwesomeIcons.user),
                            label: const Text("Giris Yap"),
                            onPressed: () {
                                FirebaseAuth.instance.signInWithEmailAndPassword(email: _email.text, password: _password.text);
                            })),
                  ],),


                TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 15),
                    ),
                    onPressed: () {
                      FirebaseAuth.instance.sendPasswordResetEmail(email: _email.text);
                    },
                    child: RichText(
                      text: const TextSpan(
                        text: 'Şifreni ',
                        style: TextStyle(
                          fontSize: 10,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'mi unuttun?',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.yellow,
                                  fontStyle: FontStyle.italic)),
                        ],
                      ),
                    )),

                  TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 15),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                      },
                      child: RichText(
                        text: const TextSpan(
                          text: 'Henüz aramıza katılmadın mı? Hemen bir ',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'hesap oluştur.',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.yellow,
                                    fontStyle: FontStyle.italic)),
                          ],
                        ),
                      ))
                ],
              ),
            ))),
      )),
    );
  }
}
