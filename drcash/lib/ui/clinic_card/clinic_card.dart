import 'package:drcash/models/clinic_model.dart';
import 'package:drcash/ui/clinic_status/clinic_status.dart';
import 'package:drcash/ui/theme.dart';
import 'package:flutter/material.dart';

class ClinicCard extends StatefulWidget {
  final Clinic clinic;
  final bool? expanded;
  final Function() onTap;

  const ClinicCard({
    Key? key,
    required this.clinic,
    required this.onTap,
    this.expanded,
  }) : super(key: key);

  @override
  State<ClinicCard> createState() => _ClinicCardState();
}

class _ClinicCardState extends State<ClinicCard> {
  BorderRadius borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: borderRadius,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              height: widget.expanded == true ? 240 : 0,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                color: AppTheme.GREY_COLOR_LIGHT_2,
              ),
              child: widget.expanded == true
                  ? const Center(
                      child: Icon(
                        Icons.hide_image,
                        size: 40,
                        color: Colors.white,
                      ),
                    )
                  : Container(),
            ),
            AnimatedPadding(
              duration: const Duration(milliseconds: 400),
              padding: EdgeInsets.symmetric(
                vertical: widget.expanded == true ? 18.0 : 12.0,
                horizontal: 12.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.clinic.tradingName ?? '',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.PRIMARY_COLOR_DARK,
                    ),
                  ),
                  Text(
                    widget.clinic.clinicType ?? '',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.PRIMARY_COLOR_DARK,
                    ),
                  ),
                  const Divider(color: AppTheme.START_COLOR),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${widget.clinic.city} - ${widget.clinic.state}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppTheme.START_COLOR,
                        ),
                      ),
                      ClinicStatus(status: widget.clinic.isActive!),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
