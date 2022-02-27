import 'package:chatapp1/screens/chatroom.dart';
import 'package:chatapp1/screens/chatroom1.dart';
import 'package:chatapp1/screens/login.dart';
import 'package:chatapp1/screens/variable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  Future registration() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.text, password: pass.text);
      // addsignup();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Chatroom1()));
  }

  addsignup() async {
    await FirebaseFirestore.instance.collection('users').add({
      'Email': email.text,
      'username': username.text,
    });
    // taskController.clear();
    email.clear();
    username.clear();
  }

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(20, 39, 69, 1.0),
        body: Stack(
          children: [
            new AppBar(
              backgroundColor: Colors.transparent,
              toolbarHeight: 220,
              elevation: 0.0,
              automaticallyImplyLeading: false,
              flexibleSpace: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(20, 39, 69, 1.0),
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
                          "Sign Up",
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
                    color: Color.fromRGBO(194, 103, 117, 1.0),
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
                      top: 100,
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
                      top: 120,
                      left: 40,
                      child: Container(
                          width: 300,
                          child: TextField(
                              controller: username,
                              style: TextStyle(
                                  color: Color.fromRGBO(20, 39, 69, 1.0)),
                              decoration: InputDecoration(
                                hintText: 'Enter your username',
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(20, 39, 69, 1.0)),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(20, 39, 69, 1.0),
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
                      top: 180,
                      left: 40,
                      child: Text(
                        "Email",
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
                      top: 200,
                      left: 40,
                      child: Container(
                          width: 300,
                          child: TextField(
                              controller: email,
                              style: TextStyle(
                                  color: Color.fromRGBO(20, 39, 69, 1.0)),
                              decoration: InputDecoration(
                                hintText: 'Enter your email',
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(20, 39, 69, 1.0)),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(20, 39, 69, 1.0),
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
                      top: 270,
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
                                  color: Color.fromRGBO(20, 39, 69, 1.0)),
                              decoration: InputDecoration(
                                hintText: 'Enter your password',
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(20, 39, 69, 1.0)),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(20, 39, 69, 1.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(20, 39, 69, 1.0),
                                  ),
                                ),
                              ))),
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
              top: 600,
              left: 40,
              height: 50,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Container(
                  child: ElevatedButton(
                onPressed: () async {
                   addsignup();
                  registration();
                 
                },
                style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(20, 39, 69, 1.0)),
                child: Text(
                  'SIGN UP',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              )),
            ),
            Positioned(
                top: 715,
                left: 85,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text('Login',
                        style: TextStyle(
                          color: Color.fromRGBO(20, 39, 69, 1.0),
                          fontSize: 17,
                          decoration: TextDecoration.underline,
                          decorationColor: Color.fromRGBO(20, 39, 69, 1.0),
                          decorationThickness: 4,
                          decorationStyle: TextDecorationStyle.solid,
                        )),
                  ),
                )),
            Positioned(
                top: 730,
                left: 50,
                child: Text(
                  "Already Have An Account?",
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
