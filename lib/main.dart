import 'package:flutter/material.dart';
import 'package:quranapp/login.dart';
import 'package:quranapp/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';
import 'package:flutter/services.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.bottom, //This line is used for showing the bottom bar
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return 
    
    FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Container(
            child: const Text("something went wrong"),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
           
            
              debugShowCheckedModeBanner: false,
              title: 'HUNGRY MAN',
              home: Login());
        }

        return Container();
      },
     );
  }
}

