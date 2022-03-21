import 'package:flutter/material.dart';

class CustomClinicCard extends StatelessWidget {
  final String title;
  final String city;
  final String state;
  final String clinicType;
  final String phoneNumber;

  const CustomClinicCard(
      {Key key,
      @required this.title,
      @required this.city,
      @required this.state,
      @required this.clinicType,
      @required this.phoneNumber})
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
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Color(0xFF00bf9c),
                  ),
                ),
                content: Container(
                  height: 90,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Cidade:",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 4),
                          Text(
                            city,
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "Estado:",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 4),
                          Text(
                            state,
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "Tipo:",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 4),
                          Text(
                            clinicType,
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "Telefone:",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 4),
                          Text(
                            phoneNumber,
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
                  FlatButton(
                    child: Text("Ok"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
      },
      child: Container(
        height: 60,
        margin: const EdgeInsets.symmetric(vertical: 5),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3,
              spreadRadius: 1,
              offset: Offset(
                0,
                0,
              ),
            )
          ],
          color: Colors.white,
          border: Border(
            left: BorderSide(
              color: Color(0xFF00bf9c),
              width: 3,
            ),
          ),
        ),
        child: Row(
          children: [
            Text(
              title.length > 45 ? title.substring(0, 20) + '...' : title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
