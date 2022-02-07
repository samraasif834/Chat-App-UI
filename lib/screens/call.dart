import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Call extends StatefulWidget {
  const Call({Key? key}) : super(key: key);

  @override
  _CallState createState() => _CallState();
}

class _CallState extends State<Call> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hello"),
        centerTitle: true,
      ),
      body: Center(
        child: buildbutton(),
      ),
    );
  }
}

Widget buildbutton() {
  final number = '03222668948';
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 48, vertical: 12),
          textStyle: TextStyle(fontSize: 24)),
      onPressed: () async {
        launch('tel://$number');
      },
      child: Text('call'));
}
