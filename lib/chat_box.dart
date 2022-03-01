import 'package:flutter/material.dart';

class Chatbox extends StatelessWidget {
  Chatbox( this.message);
  
  final String message;

  @override
  Widget build(BuildContext context) {

    
    
    final screen_size_width = MediaQuery.of(context).size.width;
    final screen_size_height = MediaQuery.of(context).size.height;

    return Row(
      children: [
        Container(
          width: screen_size_width * 0.4,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                  bottomLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(0.0))),
                  child: Text(message),
        ),
        
      ],
    );
  }
}
