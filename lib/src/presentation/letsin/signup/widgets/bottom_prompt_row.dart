import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomPromptRow extends StatelessWidget {
  const BottomPromptRow({
    Key? key,
    required this.promptText,
    required this.view,
    required this.actionText,
  }) : super(key: key);

  final String promptText;
  final Widget view;
  final String actionText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.01,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            promptText,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: Colors.grey[400],
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement<dynamic, Function>(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (context) => view,
                ),
              );
            },
            child: Text(
              actionText,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ],
      ),
    );
  }
}
