import 'dart:ffi';

import 'package:environment_ucb/themes/app_theme.dart';
import 'package:flutter/material.dart';

class MyTextCard extends StatelessWidget {
  final bool? alert;
  final double width;
  final double height;
  final Widget child;
  final Color? color;

  const MyTextCard({
    Key? key,
    this.alert,
    required this.width,
    required this.height,
    required this.child,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: child,
    );
  }
}
