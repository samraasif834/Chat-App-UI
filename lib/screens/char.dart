import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({ Key? key }) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(Icons.arrow_back),
        
        title: Row(
          children: [
            CircleAvatar(
             backgroundImage: AssetImage('assets/images/avator.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Samra"),
            )
          ],
        ),
       actions: [Padding(
         padding: const EdgeInsets.all(8.0),
         child: Icon(Icons.call),
       )],
      ),
    );
  }
}