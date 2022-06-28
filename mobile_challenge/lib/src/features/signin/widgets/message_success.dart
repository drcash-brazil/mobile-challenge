import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 10,
          ),
          Text(
            widget.text,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}