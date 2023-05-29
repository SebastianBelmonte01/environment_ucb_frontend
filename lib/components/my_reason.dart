import 'package:flutter/material.dart';

class MyReason extends StatelessWidget {
  String text;
  MyReason({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text),
  
    );
  }
}