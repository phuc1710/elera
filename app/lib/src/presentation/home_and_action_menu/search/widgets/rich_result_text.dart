import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RichResultText extends StatelessWidget {
  const RichResultText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return RichText(
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      text: TextSpan(
        text: '${AppLocalizations.of(context).resultFor} "',
        style: GoogleFonts.urbanist(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
        children: [
          TextSpan(
            text: text.replaceAll('', '\u200B'),
            style: GoogleFonts.urbanist(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).primaryColor,
            ),
          ),
          TextSpan(
            text: '"',
            style: GoogleFonts.urbanist(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
