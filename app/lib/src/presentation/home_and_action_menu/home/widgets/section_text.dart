import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionText extends StatelessWidget {
  const SectionText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.urbanist(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
    );
  }
}
