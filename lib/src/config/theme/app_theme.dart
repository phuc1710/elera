import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme() => ThemeData(
      primaryColor: const Color(0xff5f82ff),
      scaffoldBackgroundColor: Colors.white,
      textTheme: getTextTheme(),
      iconTheme: const IconThemeData(
        color: Color(0xff5f82ff),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: const Color(0xff5f82ff),
        secondary: const Color(0xffebeffe),
      ),
    );

// ignore: long-method
TextTheme getTextTheme() {
  return TextTheme(
    titleSmall: GoogleFonts.urbanist(
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: GoogleFonts.urbanist(
      fontSize: 34,
      fontWeight: FontWeight.w700,
    ),
    titleLarge: GoogleFonts.urbanist(
      fontSize: 32,
      fontWeight: FontWeight.w600,
    ),
    labelSmall: GoogleFonts.urbanist(
      fontSize: 12,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    labelMedium: GoogleFonts.urbanist(
      fontSize: 12,
      color: const Color(0xff5f82ff),
      fontWeight: FontWeight.w500,
    ),
    labelLarge: GoogleFonts.urbanist(
      fontSize: 14,
      color: const Color(0xff5f82ff),
      fontWeight: FontWeight.w600,
    ),
    bodySmall: GoogleFonts.urbanist(
      fontSize: 10,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: GoogleFonts.urbanist(
      fontSize: 18,
      color: Colors.white,
      fontWeight: FontWeight.w700,
    ),
    bodyLarge: GoogleFonts.urbanist(
      fontSize: 34,
      color: Colors.white,
      fontWeight: FontWeight.w700,
    ),
    displaySmall: GoogleFonts.urbanist(
      fontSize: 10,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    displayMedium: GoogleFonts.urbanist(
      fontSize: 12,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    displayLarge: GoogleFonts.urbanist(
      fontSize: 14,
      color: Colors.black,
      fontWeight: FontWeight.w400,
    ),
  );
}
