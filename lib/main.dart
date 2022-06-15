import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'onboarding/onboarding.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Onboarding(),
      debugShowCheckedModeBanner: false,
      theme: _theme(),
    );
  }

  _theme() => ThemeData(
        primaryColor: const Color(0xff5f82ff),
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
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
            fontWeight: FontWeight.w500,
          ),
          displayMedium: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          displayLarge: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color(0xff5f82ff),
        ),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: const Color(0xffebeffe)),
      );
}
