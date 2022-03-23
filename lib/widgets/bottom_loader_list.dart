import 'package:flutter/material.dart';

class BottomLoaderList extends StatelessWidget {
  const BottomLoaderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      left: (MediaQuery.of(context).size.width / 2) - 20,
      child: const SizedBox(
        width: 40,
        height: 40,
        child: CircleAvatar(
          child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          ),
        ),
      ),
    );
  }
}
