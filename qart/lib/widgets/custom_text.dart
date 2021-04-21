import 'package:flutter/material.dart';
import 'package:qart/utils/config.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color textColor;
  final FontWeight? fontWeight;
  const CustomText(
      {Key? key,
      this.text = "",
      this.fontSize = 14.0,
      this.textColor = Config.textColor,
      this.fontWeight})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize,
          color: textColor,
          fontFamily: Config.fontFamily,
          fontWeight: fontWeight),
    );
  }
}
