

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../core/constants/routes.dart';
import '../../../core/util/base_colors.dart';

class GreetingsPage extends StatefulWidget {
  const GreetingsPage({Key? key}) : super(key: key);

  @override
  State<GreetingsPage> createState() => _GreetingsPageState();
}

class _GreetingsPageState extends State<GreetingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          color: BaseColors.drCashPrimary,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/images/logo_drcash2.png',
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Página em desenvolvimento ;)')));
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                        child: const Text(
                          'Começar',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                         Navigator.pushNamed(context, AppRouteNames.signin);
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                        child: const Text(
                          'Entrar na minha conta',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // SizedBox(
                    //   width: 340.0,
                    //   height: 48,
                    //   child: OutlinedButton(
                    //     style: OutlinedButton.styleFrom(
                    //       side: const BorderSide(
                    //         color: Colors.white,
                    //         width: 2,
                    //         style: BorderStyle.solid,
                    //       ),
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(100),
                    //       ),
                    //     ),
                    //     onPressed: () {
                    //       widget.navigator.pushNamed(AppRouteNames.token);
                    //     },
                    //     child: const Text(
                    //       GreetingsScreenText.token,
                    //       style: TextStyle(
                    //         fontSize: 16,
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}