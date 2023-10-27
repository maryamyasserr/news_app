import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xff39A552);
  static const Color whiteColor = Color(0xffFFFFFF);
  static const Color blackColor = Color(0xff303030);
  static ThemeData lightMode = ThemeData(
      primaryColor: primaryColor,
      appBarTheme: const AppBarTheme(
        toolbarHeight: 90,
        color: primaryColor,
        centerTitle: true,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(45),
            bottomRight: Radius.circular(45),
          ),
        ),
      ),
      textTheme: TextTheme(
        titleLarge: GoogleFonts.exo(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: whiteColor
        ),
        titleMedium: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: const Color(0xff4F5A69),
        ),
        titleSmall: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: const Color(0xffA3A3A3),
        ),
        bodyLarge: GoogleFonts.poppins(
          fontSize: 23,
          fontWeight: FontWeight.bold,
          color: blackColor,
        ),
        bodyMedium: GoogleFonts.exo(
          fontSize: 22,
          fontWeight: FontWeight.w400,
          color: whiteColor,
        ),
        bodySmall: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: const Color(0xff42505C),
        ),
      ),
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide:BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide:BorderSide.none,
      ),
  )
  );
}
