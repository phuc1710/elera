import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DividerRowWithText extends StatelessWidget {
  const DividerRowWithText({
    Key? key,
    required String text,
    required EdgeInsets padding,
  })  : _text = text,
        _padding = padding,
        super(key: key);

  final String _text;
  final EdgeInsets _padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _padding,
      child: Row(
        children: [
          Expanded(
            child: Divider(
              indent: MediaQuery.of(context).size.width * 0.05,
              endIndent: MediaQuery.of(context).size.width * 0.03,
            ),
          ),
          FittedBox(
            child: Center(
              child: Text(
                _text,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Expanded(
            child: Divider(
              indent: MediaQuery.of(context).size.width * 0.03,
              endIndent: MediaQuery.of(context).size.width * 0.05,
            ),
          )
        ],
      ),
    );
  }
}
