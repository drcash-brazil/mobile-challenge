import 'package:flutter/material.dart';
import '../widgets/moods.dart';

class BuildMoodsHolder extends StatelessWidget {
  const BuildMoodsHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: -45,
        child: Container(
          height: 100,
          width: MediaQuery.of(context).size.width - 40,
          padding: const EdgeInsets.all(10),
          decoration:const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(24),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 5.5,
                  blurRadius: 5.5,
                )
              ]),
          child: const MoodsHome(),
        ));
  }
}