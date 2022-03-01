import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Newmessagesend extends StatefulWidget {
  const Newmessagesend({Key? key}) : super(key: key);

  @override
  _NewmessagesendState createState() => _NewmessagesendState();
}

class _NewmessagesendState extends State<Newmessagesend> {
  TextEditingController newmessage = TextEditingController();
  // var newmessage1 = '';
  
    // final FirebaseFirestore firestore = FirebaseFirestore.instance;


  // var user = auth.currentUser;

  sendingmessage() {
    FirebaseFirestore.instance.collection('chat').add({
      "sendingMessage": newmessage.text,
       "time" :Timestamp.now(),
       
      

    });
    newmessage.clear();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: newmessage,
              // onChanged: (value) {
              //   setState(() {
              //     newmessage1 = newmessage;
              //   });
              // },
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: InputBorder.none,
                  hintText: "Type Something......"),
            ),
          ),
          IconButton(
              onPressed: () {
                sendingmessage();
              },

              // newmessage.trim().isEmpty
              //     ? null
              //     : sendingmessage(),
              icon: Icon(
                Icons.send,
                color: Colors.red,
              ))
        ],
      ),
    );
  }
}
