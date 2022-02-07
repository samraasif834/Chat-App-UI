import 'package:chatapp1/screens/chatroom.dart';
import 'package:chatapp1/screens/signup.dart';
import 'package:chatapp1/screens/variable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // FirebaseAuth auth = FirebaseAuth.instance;


   GoogleSignIn googleSignIn = GoogleSignIn();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

   Future signInFunction()async{
     
    GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if(googleUser == null){
      return;
    }
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken
    );
    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

    DocumentSnapshot userExist = await firestore.collection('users').doc(userCredential.user!.uid).get();

    if(userExist.exists){
      print("User Already Exists in Database");
    }else{
       await firestore.collection('users').doc(userCredential.user!.uid).set({
      'email':userCredential.user!.email,
      'name':userCredential.user!.displayName,
      'image':userCredential.user!.photoURL,
      'uid':userCredential.user!.uid,
      'date':DateTime.now(),
    });
    }

  //  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>MyApp()), (route) => false);
   

  }

  Future signin() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email.text, password: pass.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Chatroom()));
      email.clear();
      pass.clear();
    }
  }

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(20, 39, 69, 1.0),
        body: Stack(
          children: [
            new AppBar(
              brightness: Brightness.dark,
              backgroundColor: Colors.transparent,
              toolbarHeight: 220,
              elevation: 0.0,
              automaticallyImplyLeading: false,
              flexibleSpace: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(194, 103, 117, 1.0),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(28),
                      bottomRight: Radius.circular(28)),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 20,
                      left: 10,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                        ),
                        iconSize: 30,
                        color: Colors.white,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Positioned(
                        top: 31,
                        left: 50,
                        child: Text(
                          "Back",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    Positioned(
                        top: 25,
                        right: 10,
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 200,
              height: 700,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(20, 39, 69, 1.0),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(28),
                        topRight: Radius.circular(28)),
                  ),
                  child: Stack(children: [
                    Positioned(
                      left: 0,
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/avator.png'),
                            backgroundColor: Colors.white,
                            radius: 40,
                          )),
                    ),
                    Positioned(
                      top: 84,
                      left: 142,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "Welcome!",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 150,
                      left: 40,
                      child: Text(
                        "Username",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(
                              187,
                              178,
                              179,
                              1.0,
                            )),
                      ),
                    ),
                    Positioned(
                      top: 170,
                      left: 40,
                      child: Container(
                          width: 300,
                          child: TextField(
                              controller: email,
                              style: TextStyle(
                                  color: Color.fromRGBO(194, 103, 117, 1.0)),
                              decoration: InputDecoration(
                                hintText: 'Enter your username',
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(194, 103, 117, 1.0)),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(194, 103, 117, 1.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(194, 103, 117, 1.0),
                                  ),
                                ),
                              ))),
                    ),
                    Positioned(
                      top: 250,
                      left: 40,
                      child: Text(
                        "Password",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(
                              187,
                              178,
                              179,
                              1.0,
                            )),
                      ),
                    ),
                    Positioned(
                      top: 300,
                      left: 40,
                      child: Container(
                          width: 300,
                          child: TextField(
                              controller: pass,
                              style: TextStyle(
                                  color: Color.fromRGBO(194, 103, 117, 1.0)),
                              decoration: InputDecoration(
                                hintText: 'Enter your password',
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(194, 103, 117, 1.0)),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(194, 103, 117, 1.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(194, 103, 117, 1.0),
                                  ),
                                ),
                              ))),
                    ),
                    Positioned(
                        top: 300,
                        left: 110,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: TextButton(
                            onPressed: () {},
                            child: Text('FORGOT?',
                                style: TextStyle(
                                  color: Color.fromRGBO(194, 103, 117, 1.0),
                                  fontSize: 15,
                                )),
                          ),
                        )),
                    Positioned(
                      top: 350,
                      right: 142,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Checkbox(
                          activeColor: Color.fromRGBO(
                            194,
                            103,
                            117,
                            1.0,
                          ),
                          checkColor: Colors.white,
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                      ),
                    ),
                    Positioned(
                        top: 365,
                        right: 200,
                        child: Text(
                          "Save password",
                          style: TextStyle(
                            color: Color.fromRGBO(
                              194,
                              103,
                              117,
                              1.0,
                            ),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ])),
            ),
            Positioned(
              top: 650,
              left: 40,
              height: 50,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Container(
                  child: ElevatedButton(
                onPressed: () {
                 signInFunction();
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(194, 103, 117, 1.0),
                ),
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              )),
            ),
            Positioned(
                top: 715,
                left: 90,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Signup()));
                    },
                    child: Text('Sign Up',
                        style: TextStyle(
                          color: Color.fromRGBO(194, 103, 117, 1.0),
                          fontSize: 17,
                          decoration: TextDecoration.underline,
                          decorationColor: Color.fromRGBO(194, 103, 117, 1.0),
                          decorationThickness: 4,
                          decorationStyle: TextDecorationStyle.solid,
                        )),
                  ),
                )),
            Positioned(
                top: 730,
                left: 72,
                child: Text(
                  "Don\'t Have An Account?",
                  style: TextStyle(
                    color: Color.fromRGBO(
                      187,
                      178,
                      179,
                      1.0,
                    ),
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ],
        ));
  }
}
