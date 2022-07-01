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
  return GoogleFonts.urbanistTextTheme(
    const TextTheme(
      titleSmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w600,
      ),
      labelSmall: TextStyle(
        fontSize: 12,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        color: Color(0xff5f82ff),
        fontWeight: FontWeight.w500,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        color: Color(0xff5f82ff),
        fontWeight: FontWeight.w600,
      ),
      bodySmall: TextStyle(
        fontSize: 10,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
      bodyLarge: TextStyle(
        fontSize: 34,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
      displaySmall: TextStyle(
        fontSize: 10,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      displayMedium: TextStyle(
        fontSize: 12,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      displayLarge: TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
