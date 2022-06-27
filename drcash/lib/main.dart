import 'package:drcash/core/routes.dart';
import 'package:drcash/core/shared_preference_helper.dart';
import 'package:drcash/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'blocs/bloc_providers.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final defaultPage = _getDefaultPage();

    return MultiBlocProvider(
      providers: BlockProviders.providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dr Cash',
        theme: ThemeData(
          primarySwatch: AppTheme.PRIMARY_COLOR,
          canvasColor: Colors.transparent,
        ),
        routes: Routes.routes,
        home: FutureBuilder<Widget>(
            future: defaultPage,
            builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
              return snapshot.data ?? Container();
            }),
      ),
    );
  }

  Future<Widget> _getDefaultPage() async {
    var helper = SharedPreferenceHelper(await SharedPreferences.getInstance());
    if (await helper.isLoggedIn) {
      return Builder(builder: Routes.routes[Routes.home]!);
    } else {
      return Builder(builder: Routes.routes[Routes.login]!);
    }
  }
}
