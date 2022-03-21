import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  final String text;
  final double height;
  final double elevation, borderRadius, fontSize, iconSize, marginLeftIcon;
  final Size size;
  final Color borderColor;
  final Color backgroundColor, textColor, onPrimary, shadowColor;
  final IconData icon;
  final Function onPressed;
  final MainAxisAlignment mainAxisAlignment;
  final EdgeInsets padding;
  final FontWeight fontWeight;
  final bool isLoading;
  const ButtonCustom({
    Key key,
    this.text = '',
    this.isLoading = false,
    this.size = const Size(64, 40),
    this.elevation = 1.0,
    this.backgroundColor,
    this.textColor,
    this.onPressed,
    this.borderRadius = 4.0,
    this.icon,
    this.iconSize = 24.0,
    this.marginLeftIcon = 8.0,
    this.onPrimary,
    this.shadowColor,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
    this.fontWeight = FontWeight.bold,
    this.fontSize = 14.0,
    this.borderColor = Colors.transparent,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: ElevatedButton(
        onPressed: onPressed as void Function(),
        style: ElevatedButton.styleFrom(
          minimumSize: size,
          padding: padding,
          elevation: elevation,
          primary: backgroundColor,
          onPrimary: onPrimary,
          shadowColor: shadowColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            side: BorderSide(color: borderColor),
          ),
        ),
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            isLoading
                ? Row(
                    children: [
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        ),
                      ),
                    ],
                  )
                : SizedBox(),
            if (icon != null)
              Row(
                children: [
                  Icon(
                    icon,
                    color: textColor,
                    size: iconSize,
                  ),
                  if (text.isNotEmpty) SizedBox(width: marginLeftIcon),
                ],
              ),
            SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontFamily: 'Montserrat',
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
