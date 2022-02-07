import 'package:chatapp1/screens/login.dart';
import 'package:chatapp1/screens/signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth1 extends StatefulWidget {
  const Auth1({Key? key}) : super(key: key);

  @override
  _Auth1State createState() => _Auth1State();
}

class _Auth1State extends State<Auth1> {

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(children: [
          Positioned(
              top: 100,
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/fingerprint1.png'))),
              )),
          Positioned(
            top: 400,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/images/p1.png'),
            ),
          ),
          Positioned(
            top: 5,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/images/p2.png'),
            ),
          ),
          Positioned(
            bottom: 480,
            left: 110,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Sign in with Touch ID',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 420,
            left: 70,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Use your Touch ID for faster ,easier \n         access to your account',
                style: TextStyle(
                  color: Color.fromRGBO(217, 210, 210, 1.0),
                  fontSize: 17,
                ),
              ),
            ),
          ),
          Positioned(
            top: 400,
            left: 70,
            height: 50,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Container(
                child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login()));
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(194, 103, 117, 1.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              child: Text(
                'Login with Email',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            )),
          ),
          Positioned(
              top: 480,
              left: 15,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Signup()));

                  },
                  child: Text('New User? Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      )),
                ),
              )),
          Positioned(
            bottom: 20,
            left: 170,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Help?',
                style: TextStyle(
                  color: Color.fromRGBO(194, 103, 117, 1.0),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ]));
  }
}
