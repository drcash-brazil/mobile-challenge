import 'package:drcash/models/clinic_model.dart';
import 'package:drcash/ui/clinic_status/clinic_status.dart';
import 'package:drcash/ui/rounded_bottom_sheet/rounded_bottom_sheet.dart';
import 'package:drcash/ui/theme.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final Clinic clinic;

  DetailsPage({Key? key, required this.clinic}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final List<Shadow> shadows = [
    const Shadow(
      offset: Offset(1.0, 1.0),
      blurRadius: 10.0,
      color: Colors.black45,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return RoundedBottomSheet(
      height: 360,
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.clinic.tradingName ?? '',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: shadows,
                  ),
                ),
                ClinicStatus(
                  status: widget.clinic.isActive!,
                  color: Colors.white,
                ),
              ],
            ),
            Text(
              widget.clinic.clinicType ?? '',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(
                  Icons.pin_drop,
                  size: 14,
                  color: Colors.white,
                ),
                Text(
                  '${widget.clinic.city} - ${widget.clinic.state}',
                  style: const TextStyle(
                    fontSize: 14,
                    // fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  print('');
                },
                style: ElevatedButton.styleFrom(
                  primary: AppTheme.PRIMARY_COLOR_DARK,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.phone),
                    SizedBox(width: 4),
                    Text('Entrar em contato'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
