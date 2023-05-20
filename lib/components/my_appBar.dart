import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? text;
  final double fontSize;
  final Color textcolor;

  const MyAppBar(
      {Key? key, this.text, required this.fontSize, required this.textcolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        text!,
        style: TextStyle(
          fontSize: fontSize,
          color: textcolor,
        ),
      ),
      flexibleSpace: const Image(
        image: AssetImage("assets/background.png"),
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
