import 'package:drcash/core/routes.dart';
import 'package:drcash/ui/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dr Cash',
      theme: ThemeData(
        primarySwatch: AppTheme.PRIMARY_COLOR,
        canvasColor: Colors.transparent,
      ),
      initialRoute: Routes.home,
      routes: Routes.routes,
    );
  }
}
