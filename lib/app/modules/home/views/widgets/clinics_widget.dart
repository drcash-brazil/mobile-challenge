import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../util/colors/colors.dart';
import '../../../util/constants/icons_constants.dart';
import '../../models/clinics/clinics_model.dart';

class ClinicsWidget extends StatelessWidget {
  const ClinicsWidget({
    Key? key,
    required this.clinic,
    required this.index,
  }) : super(key: key);

  final ClinicsModel clinic;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(IconConstant.city))),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      clinic.tradingName,
                      style: GoogleFonts.amiko(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      clinic.clinicType,
                      style: GoogleFonts.amiko(fontSize: 15),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          clinic.city,
                          style: GoogleFonts.amiko(fontSize: 15),
                        ),
                        Text(
                          ' - ${clinic.state}',
                          style: GoogleFonts.amiko(fontSize: 15),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      clinic.phoneNumber,
                      style: GoogleFonts.amiko(fontSize: 15),
                    ),
                  ],
                ),
              );
            });
      },
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorsConstants.primary.withOpacity(.3),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: ColorsConstants.primary.withOpacity(.6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        IconConstant.dentistry,
                      )),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .7,
                        child: Text(
                          clinic.tradingName,
                          style: GoogleFonts.amiko(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Image.asset(
                              IconConstant.city,
                              height: 30,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              clinic.city,
                              style: GoogleFonts.amiko(fontSize: 12),
                            ),
                            Text(
                              ' - ${clinic.state}',
                              style: GoogleFonts.amiko(fontSize: 12),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
