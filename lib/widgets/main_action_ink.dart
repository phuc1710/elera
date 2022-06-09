import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainActionInk extends StatelessWidget {
  const MainActionInk({
    Key? key,
    required String buttonString,
  }) : _buttonString = buttonString, super(key: key);

  final String _buttonString;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
          color: const Color(0xff5f82ff),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(40)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.08,
        child: Center(
            child: Text(
          _buttonString,
          style: GoogleFonts.poppins(
            color: Colors.white,
          ),
        )),
      ),
    );
  }
}
