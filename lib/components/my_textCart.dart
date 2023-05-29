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
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: alert == true ? AppTheme.alert : AppTheme.success,
      ),
      child: child,
    );
  }
}
