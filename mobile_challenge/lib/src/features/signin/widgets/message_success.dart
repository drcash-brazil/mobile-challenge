import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MessageSuccess extends StatefulWidget {
  final String text;
  const MessageSuccess({Key? key, required this.text}) : super(key: key);

  @override
  State<MessageSuccess> createState() => _MessageSuccessState();
}

class _MessageSuccessState extends State<MessageSuccess> {
  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: 50,
      width: 20,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 10,
          ),
          Text(
            widget.text,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}