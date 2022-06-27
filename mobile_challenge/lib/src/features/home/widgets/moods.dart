import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../core/util/base_colors.dart';

class MoodsHome extends StatefulWidget {
  const MoodsHome({Key? key}) : super(key: key);

  @override
  State<MoodsHome> createState() => _MoodsHomeState();
}

class _MoodsHomeState extends State<MoodsHome> {
  List<bool> isSelected = List.generate(5, (_) => false);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ToggleButtons( selectedBorderColor: BaseColors.drCashPrimary,
      renderBorder: false,
      fillColor: Colors.transparent,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0),
            child: Icon(Icons.sentiment_very_dissatisfied, size: 36,),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0),
            child: Icon(Icons.sentiment_dissatisfied, size: 36,),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0),
            child: Icon(Icons.sentiment_neutral, size: 36,),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0),
            child: Icon(Icons.sentiment_satisfied, size: 36,),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0),
            child: Icon(Icons.sentiment_very_satisfied, size: 36,),
          ),
        ],
        isSelected: isSelected,
        onPressed: (int index){
          setState(() {
            isSelected[index]=!isSelected[index];
          });
        },
        
        ),
    );
  }
}