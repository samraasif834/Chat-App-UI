import 'package:chatapp1/screens/auth.dart';
import 'package:chatapp1/screens/auth1.dart';
import 'package:chatapp1/screens/call.dart';
import 'package:chatapp1/screens/char.dart';
import 'package:chatapp1/screens/chatroom.dart';
import 'package:chatapp1/screens/chatroom1.dart';
import 'package:chatapp1/screens/newchatscreen.dart';
import 'package:chatapp1/screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // Future<Widget> SignedIn() async {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   // if (user != null) {
  //   //   return Chatroom1();
  //   // } else
  //   //   return Auth1();
  // }

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Newchatscreen(),
    );
  }
}
