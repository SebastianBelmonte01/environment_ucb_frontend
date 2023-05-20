import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String? text;
  double fontSize;
  Color color;
  TextAlign? textAlign;
  bool? bold = true;

  MyText(
      {super.key,
      required this.text,
      required this.fontSize,
      required this.color,
      this.textAlign,
      this.bold});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: "Roboto",
        color: color,
        fontWeight: bold == true ? FontWeight.bold : FontWeight.normal,
      ),
      textAlign: textAlign,
    );
  }
}
