import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_challenge_drcash/model/clinics_model.dart';
import 'package:url_launcher/url_launcher.dart';

openClinicDetailsModal(
    {required ClinicsDetails clinicsDetails, required BuildContext context}) {
  callPhoneNumber() async {
    var url = 'tel:${clinicsDetails.phoneNumber}';
    await launch(url);
  }

  showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Container(
        height: 300,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(clinicsDetails.tradingName.toString(),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 20, 105, 83),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Column(
                  children: [
                    Divider(
                      color: Colors.grey[800],
                      height: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Tipo",
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.roboto(
                                  color: Colors.grey[800],
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal)),
                          Text(clinicsDetails.clinicType.toString(),
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.roboto(
                                  color: Colors.grey[800],
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal))
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey[800],
                      height: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Localização",
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.roboto(
                                  color: Colors.grey[800],
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal)),
                          Text(
                              '${clinicsDetails.city}, ${clinicsDetails.state}',
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.roboto(
                                  color: Colors.grey[800],
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal))
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey[800],
                      height: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Telefone",
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.roboto(
                                  color: Colors.grey[800],
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal)),
                          Row(
                            children: [
                              Text('${clinicsDetails.phoneNumber}',
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.roboto(
                                      color: Colors.grey[800],
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal)),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: callPhoneNumber,
                                child: Text("Ligar",
                                    style: GoogleFonts.roboto(
                                        color: Colors.blueAccent,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal)),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side:
                                  const BorderSide(color: Colors.transparent))),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 20, 105, 83))),
                  onPressed: () => {Navigator.pop(context)},
                  child: Text(
                    'VOLTAR',
                    style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
