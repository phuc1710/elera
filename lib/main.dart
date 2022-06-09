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
        textTheme: TextTheme(
          titleMedium: GoogleFonts.poppins(
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
          titleLarge: GoogleFonts.poppins(
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
          button: GoogleFonts.poppins(
            color: Colors.white,
          ),
        ),
        
      );
}
