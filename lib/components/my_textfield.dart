import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatefulWidget {
  TextEditingController myTextController;
  bool? isPassword;
  TextInputType keyboardType;
  double width;
  double height;
  String? hintText;
  bool digitsOnly;
  bool positiveOnly;
  bool integersOnly;
  MyTextField(
      {super.key,
      required this.height,
      required this.width,
      required this.myTextController,
      required this.keyboardType,
      this.isPassword,
      this.hintText,
      this.digitsOnly = false,
      this.positiveOnly = false,
      this.integersOnly = false,
      });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {

  List<TextInputFormatter> getInputFormatters() {
    List<TextInputFormatter> inputFormatters = [];
    if (widget.digitsOnly) {
      inputFormatters.add(FilteringTextInputFormatter.digitsOnly);
    }
    if (widget.positiveOnly) {
      inputFormatters.add(FilteringTextInputFormatter.allow(RegExp(r'[0-9]')));
    }
    if (widget.integersOnly) {
      inputFormatters.add(FilteringTextInputFormatter.allow(RegExp(r'^-?[0-9]*$')));
    }
    return inputFormatters;
  }

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
          inputFormatters:getInputFormatters(),
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


