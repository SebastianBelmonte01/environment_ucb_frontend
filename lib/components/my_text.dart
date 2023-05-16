import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String? text;
  double fontSize;
  Color color;

  MyText({super.key, required this.text, required this.fontSize, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: "Roboto",
        color: color,
        fontWeight: FontWeight.bold
      )
    );
  }
}