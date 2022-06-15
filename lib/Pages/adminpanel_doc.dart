import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:updapp/Attributes/main_drawer.dart';
import 'package:updapp/Attributes/whole_background.dart';

import '../Attributes/container_decoration.dart';
import '../Firestore/read_text_from_firebase.dart';
import '../Firestore/userclass.dart';
import '../Widgets/Pages/textwrite_widget.dart';

class DocControlPanel extends StatefulWidget {
  const DocControlPanel({Key? key}) : super(key: key);

  @override
  State<DocControlPanel> createState() => _DocControlPanelState();
}

class _DocControlPanelState extends State<DocControlPanel> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: MainDrawer(context),
        appBar: AppBar(backgroundColor: Colors.deepPurple.withOpacity(0.6),),
        body: BackG(
            child: Container(
              margin: EdgeInsets.all(20),
              child: Container(
                child: getText(),
                decoration: ConstDecoration(color: Colors.white, radiuscondition: true, radius: 30),
                constraints: const BoxConstraints.expand(),
              ),
            ))
      ),
    );
  }

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
    final docUserDel =FirebaseFirestore.instance
        .collection("usersaves")
        .doc(curId);

    return Column(
      children: [
        Column(
          children: [
            Text(user.mail.toString()),
            ListTile(
              title:Text(user.title.toString()),
              subtitle: Text(user.text.toString()),

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
          ],
        ),
        Divider(),
      ],
    );}
// <-- BUİLD USER WİDGET //

}


