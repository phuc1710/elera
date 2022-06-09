import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({
    Key? key,
    required this.imagePath,
    required this.text,
  }) : super(key: key);

  final String imagePath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Image.asset(imagePath),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
