
import 'package:firebase_auth/firebase_auth.dart';
import 'package:updapp/FirebaseAuth/loading_func.dart';


Future signIn(email, password,context,)async{
  try{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e){
    print(e);
  }
}