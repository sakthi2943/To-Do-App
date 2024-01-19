import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/auth/authscreen.dart';
import 'package:todo_list/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyDkhiNJ7xIzdH3Fq8rpmLFXR0OvcKhnbz8',
      projectId: 'todolist-d8c31',
      storageBucket: 'todolist-d8c31.appspot.com',
      appId: '1:149955059226:android:86ad1ca22244782f9afba3',
      messagingSenderId: '149955059226',
    ),
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        brightness: Brightness.dark, primaryColor: const Color(0xff6a5acd)),
    home: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, usersnapshot) {
        if (usersnapshot.hasData) {
          return const Home();
        } else {
          return const AuthScreen();
        }
      },
    ),

    // StreamBuilder<User?>(
    //     stream: FirebaseAuth.instance.authStateChanges as Stream<User?>,
    //     builder: (context, usersnapshot) {
    //       if (usersnapshot.hasData) {
    //        return Container(child: Text('Authenticated'));
    //       } else {
    //          return Container(child: Text('Not Authenticated'));
    //       }
    //     }),
  ));
}
