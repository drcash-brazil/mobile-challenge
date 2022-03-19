import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

import '../../../util/colors/colors.dart';
import '../../../util/widgets/size_font.dart';

class ButtonsLoginOurRegister extends StatelessWidget {
  const ButtonsLoginOurRegister(
      {Key? key, required this.onTapLogin, required this.onTapRegister})
      : super(key: key);

  final Function() onTapLogin;
  final Function() onTapRegister;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.width * .1,
        top: MediaQuery.of(context).size.width * .0,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.width * .0,
              top: MediaQuery.of(context).size.width * .1,
            ),
            child: InkWell(
              onTap: onTapLogin,
              child: Container(
                height: 45,
                width: MediaQuery.of(context).size.width / 1.2,
                decoration: BoxDecoration(
                  gradient:
                      LinearGradient(colors: ColorsConstants.linearGradient),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                child: Center(
                  child: Text(
                    FlutterI18n.translate(context, 'telaLogin.entrar')
                        .toUpperCase(),
                    style: const TextStyle(
                      color: ColorsConstants.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              FlutterI18n.translate(context, 'telaLogin.ou'),
              style: const TextStyle(color: ColorsConstants.neutralGray),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: InkWell(
              onTap: onTapRegister,
              child: Text(
                FlutterI18n.translate(context, 'telaLogin.cadastrar'),
                style: TextStyle(
                  color: ColorsConstants.primary,
                  fontSize: getValueFont(
                    context: context,
                    valueMin: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
