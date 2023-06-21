import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  TextEditingController myTextController;
  bool? isPassword;
  TextInputType keyboardType;
  double width;
  double height;
  String? hintText;
  MyTextField(
      {super.key,
      required this.height,
      required this.width,
      required this.myTextController,
      required this.keyboardType,
      this.isPassword,
      this.hintText});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        height: widget.height,
        child: TextField(
          controller: widget.myTextController,
          keyboardType: widget.keyboardType,
          textAlign: TextAlign.center,
          obscureText: widget.isPassword ?? false,
          decoration: InputDecoration(
            hintText: widget.hintText,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(
                color: Color(0xFF2C3E6C),
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(
                color: Color(0xFF2C3E6C),
                width: 2,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 1.0,
              vertical: 1.0,
            ),
          ),
        ));
  }
}
