
import 'package:firebase_auth/firebase_auth.dart';

import 'loading_func.dart';

Future signUp(email, password,context)async{
  try{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e){
    print(e);
  }
}
