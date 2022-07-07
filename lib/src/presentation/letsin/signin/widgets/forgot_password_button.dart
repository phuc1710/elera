import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../forgot_and_reset_password/select_contact/views/select_contact_view.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({Key? key, required this.email}) : super(key: key);

  final String email;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push<dynamic>(
          context,
          MaterialPageRoute<dynamic>(
            builder: (context) => SelectContactView(email: email),
          ),
        );
      },
      child: Text(
        'Forgot the password?',
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
