import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme() => ThemeData(
        primaryColor: const Color(0xff5f82ff),
        scaffoldBackgroundColor: Colors.white,
        textTheme: getTextTheme(),
        iconTheme: const IconThemeData(
          color: Color(0xff5f82ff),
        ),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: const Color(0xffebeffe)),
      );

TextTheme getTextTheme() {
  return TextTheme(
        titleSmall: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: GoogleFonts.poppins(
          fontSize: 30,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: GoogleFonts.poppins(
          fontSize: 32,
          fontWeight: FontWeight.w600,
        ),
        labelSmall: GoogleFonts.poppins(
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        labelMedium: GoogleFonts.poppins(
          fontSize: 12,
          color: const Color(0xff5f82ff),
          fontWeight: FontWeight.w500,
        ),
        labelLarge: GoogleFonts.poppins(
          fontSize: 14,
          color: const Color(0xff5f82ff),
          fontWeight: FontWeight.w600,
        ),
        displaySmall: GoogleFonts.poppins(
          fontSize: 10,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        displayMedium: GoogleFonts.poppins(
          fontSize: 12,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        displayLarge: GoogleFonts.poppins(
          fontSize: 14,
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
      );
}
