import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:updapp/Firestore/userclass.dart';

Future createFTData({id, title, text}) async{
  final Random random = new Random();
  final rID = random.nextInt(999999999);
  final now = DateTime.now();
  final currentDocID = (id + "-${rID.toString()}");
  final curUSer = FirebaseAuth.instance.currentUser;
  final lasUser = FirebaseFirestore.instance.collection("usersaves").doc(currentDocID);

  final user = UserA(
    id: lasUser.id,
    mail: curUSer?.email.toString(),
    title: title,
    text: text,
    createDate: now.toString(),
  );

  final json = user.toJson();
  await lasUser.set(json);
}

