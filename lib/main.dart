import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Pages/mainpage.dart';
import 'Widgets/Pages/homepage_widget.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    theme: ThemeData.light(),
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.active) {
            return const Center(
                child: CircularProgressIndicator(
                  color: Colors.deepOrange,
                ));
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Tüh! Anlaşılan bir şeyler ters gitti :("),
            );
          } else if (snapshot.hasData) {
            return MainPage();
          } else {
            return HomePageUI();
          }
        });
  }
}
