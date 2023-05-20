import 'dart:ffi';

import 'package:environment_ucb/themes/app_theme.dart';
import 'package:flutter/material.dart';

class myTextCard extends StatelessWidget {
  final bool? alert;
  final double width;
  final double height;
  final Widget child;

  const myTextCard({
    Key? key,
    this.alert,
    required this.width,
    required this.height,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: alert == true ? AppTheme.alert : AppTheme.primary,
      ),
      child: child,
    );
  }
}
