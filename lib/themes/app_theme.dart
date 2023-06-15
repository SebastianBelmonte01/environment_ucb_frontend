import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color.fromRGBO(67, 147, 90, 1);
  static const Color secondary = Color(0xFF2C3E6C);
  static const Color alert = Color(0xffCB3B3B);
  static const Color success = Color.fromRGBO(90, 182, 116, 1);
  static const Color warning = Color.fromRGBO(203, 59, 59, 1);
  static const Color borderColor = Color.fromRGBO(211, 211, 211, 1);
  static const cardColor = Colors.white;
  static const shadow = Colors.black12;
  static const Color textButton = Colors.white;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primary,
    appBarTheme: const AppBarTheme(color: primary, elevation: 0),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primary,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: primary,
            shape: const StadiumBorder(),
            elevation: 0)),
    inputDecorationTheme: const InputDecorationTheme(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: primary),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: primary),
      ),
      labelStyle: TextStyle(color: secondary),
    ),
    scaffoldBackgroundColor: Colors.white,
  );
}
