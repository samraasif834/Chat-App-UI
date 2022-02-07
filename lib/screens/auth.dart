// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class Auth extends StatefulWidget {
//   const Auth({Key? key}) : super(key: key);

//   @override
//   _AuthState createState() => _AuthState();
// }

// class _AuthState extends State<Auth> {
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   GoogleSignIn google = GoogleSignIn();
//   GoogleSignInAccount? user;
//   FirebaseFirestore firestore = FirebaseFirestore.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade400,
//       body: Column(
//         children: [
//           Expanded(
//             child: Container(
//               margin: EdgeInsets.only(bottom: 500),
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage('assets/images/img1.png'))),
//             ),
//           ),
//           Text(
//             "Chat App",
//             style: TextStyle(
//                 color: Colors.purpleAccent.shade400,
//                 fontSize: 35,
//                 fontWeight: FontWeight.bold),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//             child: ElevatedButton(
//                 onPressed: () async {
//                   try {
//                     final googleMethod = await google.signIn();
//                     user = googleMethod;
//                     final auth = await googleMethod!.authentication;
//                     final cred = GoogleAuthProvider.credential(
//                         accessToken: auth.idToken, idToken: auth.idToken);
//                     await FirebaseAuth.instance
//                         .signInWithCredential(cred)
//                         .whenComplete(() {
//                       print(user!.email.toString());
//                       print(user!.displayName.toString());
//                       print(user!.photoUrl.toString());
//                     });
//                   } catch (e) {
//                     print(e);
//                   }
//                 },
//                 style: ElevatedButton.styleFrom(
//                     primary: Colors.black,
//                     padding: EdgeInsets.symmetric(vertical: 10)),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Image.asset(
//                       'assets/images/logo.png',
//                       height: 50,
//                       width: 80,
//                     ),
//                     Text(
//                       "Sign with google",
//                       style: TextStyle(
//                         fontSize: 20,
//                       ),
//                     )
//                   ],
//                 )),
//           )
//         ],
//       ),
//     );
//   }
// }
