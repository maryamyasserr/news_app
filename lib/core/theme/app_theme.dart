import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xff39A552);
  static ThemeData lightMode = ThemeData(
    primaryColor: primaryColor,
    appBarTheme: const  AppBarTheme(
      toolbarHeight: 75,
      color: primaryColor,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
    ),
  );
}
