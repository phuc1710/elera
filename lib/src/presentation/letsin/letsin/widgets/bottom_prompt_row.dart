import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../signup/views/signup_view.dart';

class BottomPromptRow extends StatelessWidget {
  const BottomPromptRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w300,
            color: Colors.grey[400],
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push<dynamic>(
              context,
              MaterialPageRoute<dynamic>(
                builder: (context) => const SignUpView(),
              ),
            );
          },
          child: Text(
            'Sign up',
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
      ],
    );
  }
}
