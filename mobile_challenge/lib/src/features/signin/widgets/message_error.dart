import 'package:flutter/material.dart';

class MessageError extends StatefulWidget {
  final String text;
  const MessageError({Key? key, required this.text}) : super(key: key);

  @override
  State<MessageError> createState() => _MessageErrorState();
}

class _MessageErrorState extends State<MessageError> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 20,
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.red,
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
