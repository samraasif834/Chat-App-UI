import 'package:chatapp1/screens/messages.dart';
import 'package:chatapp1/screens/newmessagesend.dart';
import 'package:flutter/material.dart';

class Newchatscreen extends StatefulWidget {
  const Newchatscreen({ Key? key }) : super(key: key);

  @override
  _NewchatscreenState createState() => _NewchatscreenState();
}

class _NewchatscreenState extends State<Newchatscreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body:Container(
        child: Column(
          children: [
            Expanded(child: Messages()),
            Newmessagesend(),
          ],
        ),
      )
    );
  }
}