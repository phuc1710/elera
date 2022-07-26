import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomPromptRow extends StatelessWidget {
  const BottomPromptRow({
    Key? key,
    required this.promptText,
    required this.path,
    required this.actionText,
  }) : super(key: key);

  final String promptText;
  final String path;
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
            style: GoogleFonts.urbanist(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.grey[400],
            ),
          ),
          TextButton(
            onPressed: () => context.router.replaceNamed(path),
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
