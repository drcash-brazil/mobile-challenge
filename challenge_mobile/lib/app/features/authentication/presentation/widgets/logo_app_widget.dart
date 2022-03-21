import 'package:flutter/material.dart';

class LogoApp extends StatefulWidget {
  final double width, height;
  final bool roundedLogo, animation, isIcon;
  final EdgeInsets padding, margin;
  final Duration duration;

  LogoApp({
    Key key,
    this.width = 80.0,
    this.height = 80.0,
    this.roundedLogo = false,
    this.animation = false,
    this.padding = const EdgeInsets.all(8.0),
    this.margin = const EdgeInsets.all(8.0),
    this.duration = const Duration(milliseconds: 700),
    this.isIcon = false,
  }) : super(key: key);

  @override
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> {
  final _opacity = ValueNotifier<double>(0.0);

  @override
  void initState() {
    super.initState();

    if (widget.animation)
      _animateLogo(_opacity);
    else
      _opacity.value = 1.0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      margin: widget.margin,
      child: ValueListenableBuilder<double>(
        valueListenable: _opacity,
        builder: (context, opacity, child) => AnimatedOpacity(
          duration: widget.duration,
          opacity: opacity,
          child: Image.asset(
            "assets/images/logo_drcash.png",
          ),
        ),
      ),
    );
  }

  void _animateLogo(ValueNotifier<double> opacity) async {
    await Future.delayed(widget.duration);
    opacity.value = 1.0;
  }
}
