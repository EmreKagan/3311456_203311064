import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:updapp/Attributes/const_text_field.dart';
import '../../Attributes/container_decoration.dart';
import '../../Attributes/whole_background.dart';
import '../../main.dart';
import 'package:email_validator/email_validator.dart';

class RegisterPageUI extends StatefulWidget {
  const RegisterPageUI({Key? key}) : super(key: key);

  @override
  State<RegisterPageUI> createState() => _RegisterPageUIState();
}

class _RegisterPageUIState extends State<RegisterPageUI> {
  late TextEditingController _emailR;
  late TextEditingController _passwordR;
  late TextEditingController _repassword;

  @override
  void initState() {
    super.initState();
    _emailR = TextEditingController();
    _passwordR = TextEditingController();
    _repassword = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailR.dispose();
    _passwordR.dispose();
    _repassword.dispose();
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
              color: Colors.grey),
          constraints: const BoxConstraints.expand(),
          margin: const EdgeInsets.all(20),
          child: FittedBox(
            child: Container(
                margin: const EdgeInsets.fromLTRB(20, 50, 20, 50),
                child: Form(
                  child: Column(
                    children: [

                      ConstTextFormField(controller: _emailR,labelT: "Email",validate:
                          (email) => email != null &&
                          !EmailValidator.validate(email)
                          ? "Geçerli bir e-posta giriniz."
                          : null),

                      ConstTextFormField(controller: _passwordR,labelT: "Şifre",obscure: true,validate:
                          (value) =>
                          value != null && value.length < 6
                          ? "En az 8 karakter giriniz"
                          : null,
                      ),

                      ConstTextFormField(controller: _repassword,labelT: "Şifreni Onayla",obscure: true,validate:
                          (revalue) => revalue != null &&
                          _repassword.text != _passwordR.text
                          ? "Şifreleriniz birbiriyle uyuşmuyor."
                          : null,
                      ),

                      /////////////////////////////////////////////////////////////////////////////////
                      /////////////////////////////////////////////////////////////////////////////////
                      Container(
                          margin: const EdgeInsets.all(20),
                          child: FloatingActionButton.extended(
                              backgroundColor: Colors.deepOrangeAccent,
                              icon: const Icon(FontAwesomeIcons.user),
                              label: const Text("Kayıt Ol"),
                              onPressed: () {
                                  FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailR.text, password: _repassword.text);
                                  SnackBar(content: Text("Başarıyla giriş yapıldı."),backgroundColor: Colors.green,);
                              })),
                      //////////////////////////////////////////////////////////////////////////////////
                      //////////////////////////////////////////////////////////////////////////////////

                      TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 15),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                          },
                          child: RichText(
                            text: TextSpan(
                              text: 'Mevcut bir hesabın var mı? Hemen ',
                              style: TextStyle(
                                fontSize: 10,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'giris yap.',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.yellow,
                                        fontStyle: FontStyle.italic)),
                              ],
                            ),
                          ))
                    ],
                  ),
                )),
          ),
        )),
      ),
    );
  }
}
