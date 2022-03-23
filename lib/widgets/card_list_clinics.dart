import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_challenge_drcash/model/clinics_model.dart';
import 'package:mobile_challenge_drcash/widgets/clinics_details_modal.dart';

class CardListClinics extends StatelessWidget {
  final ClinicsDetails clinic;

  CardListClinics({
    required this.clinic,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        openClinicDetailsModal(clinicsDetails: clinic, context: context);
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 250,
                    child: Text(clinic.tradingName.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(
                            color: Colors.grey[800],
                            fontSize: 18,
                            fontWeight: FontWeight.normal)),
                  ),
                  Text("Ver mais",
                      style: GoogleFonts.roboto(
                          color: const Color.fromARGB(255, 20, 105, 83),
                          fontSize: 12,
                          fontWeight: FontWeight.normal)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(clinic.clinicType.toString(),
                  style: GoogleFonts.roboto(
                      color: Colors.grey[600],
                      fontSize: 14,
                      fontWeight: FontWeight.normal)),
            ],
          ),
        ),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
      ),
    );
    ;
  }
}
