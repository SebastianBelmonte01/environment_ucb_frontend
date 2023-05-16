import 'package:flutter/material.dart';

import 'my_text.dart';

class MyButton extends StatelessWidget {
  final String? text;
  final Function? onPressed;
  final Icon ?icon;
  double fontSize;
  double width;
  double height;
  Color color;
  Color textColor;
  MyButton({super.key, this.onPressed, this.text, this.icon, required this.fontSize, required this.width, required this.height, required this.color, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child:     ElevatedButton(
      onPressed: () {
        onPressed!();
      }, 
      style: ElevatedButton.styleFrom(
        minimumSize: Size(235, 34),
        primary: color,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: Color.fromARGB(255, 30, 41, 125))

          
        )
      ),
      child:
        icon != null ? Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon!,
            SizedBox(width: 10),
            MyText(text: text, fontSize: fontSize, color: textColor),
          ],
        ) :
        MyText(text: text, fontSize: fontSize, color: textColor),
      )  
    );
    

  }
}