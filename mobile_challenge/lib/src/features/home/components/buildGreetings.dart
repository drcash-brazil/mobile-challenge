import 'package:flutter/material.dart';

class BuildGreetings extends StatelessWidget {
  const BuildGreetings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 20.0,
        bottom: 90.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Oi Lucas,',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              'Como você está se sentindo hoje?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
            ),
          ],
        ));
  }
}
