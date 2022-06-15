import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:updapp/Attributes/container_decoration.dart';
import 'package:updapp/Firestore/read_text_from_firebase.dart';
import 'package:updapp/Widgets/Pages/textwrite_widget.dart';
import '../../Attributes/main_drawer.dart';
import '../../Attributes/whole_background.dart';
import '../../Firestore/userclass.dart';

class SavesPageUI extends StatefulWidget {
  const SavesPageUI({Key? key}) : super(key: key);

  @override
  State<SavesPageUI> createState() => _SavesPageUIState();
}

class _SavesPageUIState extends State<SavesPageUI> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple.withOpacity(0.6),
          ),
          drawer: MainDrawer(context),
          body: BackG(
              child: Container(
                margin: EdgeInsets.all(20),
                child: Container(
                  child: getText(),
                  decoration: ConstDecoration(color: Colors.white, radiuscondition: true, radius: 30),
                  constraints: const BoxConstraints.expand(),
                ),
              ))),
    );
  }



// *******************************************//

// GET TEXT FROM FIRESTORE --> //
  StreamBuilder getText(){
    return StreamBuilder<List<UserA>>(
        stream: readUser(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
                child: Text(
                    "Tüh! Anlaşılan bir şeyler ters gitti :("));
          } else if (snapshot.hasData) {
            final users = snapshot.data!;
            return ListView(
                children: users.map(buildUser).toList());
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
  // <-- GET TEXT FROM FIRESTORE //

// *******************************************//

  // BUİLDUSER WİDGET (SAVES TILES) --> //
  Widget buildUser(UserA user){

    // Firestore'un koleksiyon ID si ile kullanıcı ID si karşılaştırması. //
    final curId = user.id;
    final purID = curId.toString().split("-");
    final proID = purID[0];
    final currentUser = FirebaseAuth.instance.currentUser;
    final curproID = currentUser?.uid.toString();
    final docUserDel =FirebaseFirestore.instance
        .collection("usersaves")
        .doc(curId);

    return (proID == curproID)? Column(
      children: [
        ListTile(
          title: (proID == curproID)
              ? (Text(user.title.toString()))
              : Text(""),

          // Eğer gelen veri 50 karakterden uzunsa sadece illk 50 karakteri çeker. //
          subtitle: (proID == curproID) ?
          ((user.text.toString().length >50) ?
          Text(user.text.toString().substring(0,50)+"...") :
          Text(user.text.toString())) :
          Text(""),

          // Kayıtın üstüne tıklandığında düzenlemek için TextPage'e gider. //
          onTap:(){
            Navigator.push(context, MaterialPageRoute(builder: (context) => TextPageUI(
                edit: true,
                savedTitle: user.title.toString(),
                savedText: user.text.toString(),
                currentID: user.id,
            )));
          },

          onLongPress: (){
            showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Text("Silmek istediğine emin misin?"),
                  content: Text("Sonsuza kadar kaybolacak. Bu uzun bir süre."),
                  actions: <Widget>[
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                    }, child: Text("İptal et")),
                    TextButton(onPressed: (){
                      docUserDel.delete();
                      Navigator.pop(context);
                    }, child: Text("SİL")),
                  ],
                ));
          },
        ),
        Divider(),
      ],
    ):Text("");}
// <-- BUİLD USER WİDGET //
// *******************************************//
}

