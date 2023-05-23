import 'dart:ffi';

import 'package:environment_ucb/themes/app_theme.dart';
import 'package:flutter/material.dart';

class mySpecialCard extends StatelessWidget {
  final bool? alert;
  final double width;
  final double height;
  final Widget child;
  final Color borderColor;

  const mySpecialCard({
    Key? key,
    this.alert,
    required this.width,
    required this.height,
    required this.child,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Center(
        child: Container(
          width: width,
          height: height,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            border: Border.all(
              color: borderColor,
              width: 1,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}
