import 'package:environment_ucb/themes/app_theme.dart';
import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onPressed;
  const MyIconButton({
    Key? key,
    required this.text,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).size.height * 0.05,
      child: Center(
        child: ElevatedButton.icon(
          onPressed: onPressed,
          icon: Icon(icon),
          label: Text(""),
          style: ElevatedButton.styleFrom(
            alignment: Alignment.centerRight,
            backgroundColor: AppTheme.secondary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
      ),
    );
  }
}
