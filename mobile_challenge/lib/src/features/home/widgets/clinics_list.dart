import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../core/util/base_colors.dart';

class ClinicsCard extends StatelessWidget {
  final String title;
  final String city;
  final String state;
  final String clinicType;

  const ClinicsCard(
      {Key? key,
      required this.title,
      required this.city,
      required this.state,
      required this.clinicType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: BaseColors.drCashPrimary,
                  ),
                ),
                content: SizedBox(
                  height: 90,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Cidade:",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            city,
                            style: const TextStyle(
                              fontSize: 13,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Text(
                            "Estado:",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            state,
                            style: const TextStyle(
                              fontSize: 13,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Text(
                            "Tipo:",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            clinicType,
                            style: const TextStyle(
                              fontSize: 13,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: const [
                          Text(
                            "Telefone:",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 4),
                          Text(
                            '(92) 99999-9999',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    child: const Text("Fechar"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });
      },
      child: Container(
        height: 60,
        margin: const EdgeInsets.symmetric(vertical: 5),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3,
              spreadRadius: 1,
              offset: Offset(
                2,
                2,
              ),
            )
          ],
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: BaseColors.drCashPrimary,
              width: 12,
            ),
          ),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.medical_services,
              color: BaseColors.drCashPrimary,
            ),
            const SizedBox(
              width: 16.0,
            ),
            Text(
              title.length > 45 ? title.substring(0, 20) + '...' : title,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
