import 'package:flutter/material.dart';

import '../../../core/util/base_colors.dart';

class BuildBanner extends StatelessWidget {
  const BuildBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: BaseColors.drCashPrimary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Com a Dr.Cash você tem mais motivos para aproveitar sua saúde! Aproveite alguns dos nossos parceiros abaixo.',
            style: TextStyle(
              fontSize: 17.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
