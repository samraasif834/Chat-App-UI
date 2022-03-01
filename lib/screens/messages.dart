import 'package:chatapp1/chat_box.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder <QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('chat').orderBy('time',descending: true).snapshots(),
     builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          shrinkWrap: true,
          reverse: true,
          physics: NeverScrollableScrollPhysics(),
         itemCount: snapshot.data!.docs.length,
         itemBuilder: (context, index) {
            return Chatbox(snapshot.data!.docs[index]['sendingMessage'],);

          });
      },
    );
  }
}
