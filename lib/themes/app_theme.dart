import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color.fromRGBO(67, 147, 90, 1);
  static const Color secondary = Colors.grey;
  static const Color alert = Color(0xffED4B4B);
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
