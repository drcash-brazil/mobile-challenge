import 'package:flutter/material.dart';

class ClinicsPage extends StatefulWidget {
  final String title;
  const ClinicsPage({Key? key, this.title = 'ClinicsPage'}) : super(key: key);
  @override
  ClinicsPageState createState() => ClinicsPageState();
}
class ClinicsPageState extends State<ClinicsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}