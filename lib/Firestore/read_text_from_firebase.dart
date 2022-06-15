import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:updapp/Firestore/userclass.dart';

Stream<List<UserA>> readUser() => FirebaseFirestore.instance
    .collection("usersaves")
    .snapshots()
    .map((snapshot) =>
    snapshot.docs.map((doc) => UserA.fromJson(doc.data())).toList());

