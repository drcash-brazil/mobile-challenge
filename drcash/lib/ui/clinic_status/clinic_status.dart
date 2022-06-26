import 'package:drcash/ui/theme.dart';
import 'package:flutter/material.dart';

class ClinicStatus extends StatefulWidget {
  final bool status;
  final Color? color;

  const ClinicStatus({
    Key? key,
    required this.status,
    this.color,
  }) : super(key: key);

  @override
  State<ClinicStatus> createState() => _ClinicStatusState();
}

class _ClinicStatusState extends State<ClinicStatus> {
  @override
  Widget build(BuildContext context) {
    Color statusColor = widget.status ? AppTheme.START_COLOR : Colors.redAccent;
    String statusText = widget.status ? 'Ativo' : 'Inativo';
    return Row(
      children: [
        Icon(
          Icons.circle,
          size: 12,
          color: statusColor,
        ),
        Text(
          statusText,
          style: TextStyle(
            fontSize: 12,
            color: widget.color ?? statusColor,
          ),
        ),
      ],
    );
  }
}
