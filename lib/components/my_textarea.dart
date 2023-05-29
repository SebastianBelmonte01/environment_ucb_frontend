import 'package:flutter/material.dart';


class MyTextArea extends StatefulWidget {

  final double height;
  final double width;
  final TextEditingController myTextController;
  final Color borderColor;
  final bool enable;

  const MyTextArea({
    Key? key,
    required this.height,
    required this.width,
    required this.myTextController,
    required this.borderColor,
    required this.enable,
  }) : super(key: key);

  @override
  State<MyTextArea> createState() => _MyTextAreaState();
}

class _MyTextAreaState extends State<MyTextArea> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.myTextController,
      keyboardType: TextInputType.multiline,
      enabled: widget.enable,
      maxLines: 10,
      textAlign: TextAlign.left,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
            color: widget.borderColor,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
            color: widget.borderColor,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
            color: widget.borderColor,
            width: 2,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 12.0,
            ),
      ),

    );
  }
}

