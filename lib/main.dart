import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_chat_app/screen/sign_screen.dart';
import 'package:my_chat_app/screen/signup_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<FirebaseApp> _initializeFirebaseApp = Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: '',
    appId: '1:95909624243:android:7f67fbac1dcd608966b3c6',
    messagingSenderId: '',
    projectId: 'mychatapp-e3d48',
  ));
  //MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     // This is the theme of your application.
    //     //
    //     // Try running your application with "flutter run". You'll see the
    //     // application has a blue toolbar. Then, without quitting the app, try
    //     // changing the primarySwatch below to Colors.green and then invoke
    //     // "hot reload" (press "r" in the console where you ran "flutter run",
    //     // or simply save your changes to "hot reload" in a Flutter IDE).
    //     // Notice that the counter didn't reset back to zero; the application
    //     // is not restarted.
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: SignupScreen(),
    // );

    return FutureBuilder(
        future: _initializeFirebaseApp,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('Error Occured');
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              home: SignupScreen(),
            );
          }
          return CircularProgressIndicator();
        });
  }
}
