import 'package:drcash/ui/theme.dart';
import 'package:flutter/material.dart';

class ClinicLoading extends StatefulWidget {
  const ClinicLoading({Key? key}) : super(key: key);

  @override
  State<ClinicLoading> createState() => _ClinicLoadingState();
}

class _ClinicLoadingState extends State<ClinicLoading> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: const BoxDecoration(
        color: AppTheme.PRIMARY_COLOR_DARK,
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      child: const CircularProgressIndicator(),
    );
  }
}
