import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme() => ThemeData(
      primaryColor: const Color(0xff335ef7),
      scaffoldBackgroundColor: Colors.white,
      textTheme: getNewTextTheme().apply(
        displayColor: Colors.grey[900],
        bodyColor: Colors.grey[900],
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: const Color(0xff335ef7),
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

// ignore: long-method
TextTheme getNewTextTheme() {
  return GoogleFonts.urbanistTextTheme(
    const TextTheme(
      headline1: TextStyle(
        fontSize: 101,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
      ),
      headline2: TextStyle(
        fontSize: 63,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
      ),
      headline3: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
      headline4: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.25,
      ),
      headline5: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
      ),
      headline6: TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.15,
      ),
      subtitle1: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
      ),
      subtitle2: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      ),
      bodyText1: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.15,
      ),
      bodyText2: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.25,
      ),
      button: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.25,
      ),
      caption: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
      ),
      overline: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      ),
    ),
  );
}
