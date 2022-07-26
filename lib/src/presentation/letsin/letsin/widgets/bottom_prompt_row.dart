import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          style: GoogleFonts.urbanist(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.grey[400],
          ),
        ),
        TextButton(
          onPressed: () => context.router.pushNamed('/sign_up'),
          child: Text(
            'Sign up',
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
      ],
    );
  }
}
