import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'trailing_buttons_row.dart';

class UserHeaderListTile extends StatelessWidget {
  const UserHeaderListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          radius: 30,
        ),
        minLeadingWidth: 0,
        contentPadding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.02,
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            'Good Morning 👋',
            style: GoogleFonts.urbanist(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.grey[400],
            ),
          ),
        ),
        subtitle: Text(
          'Andrew Ainsley',
          style: GoogleFonts.urbanist(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        trailing: const TrailingButtonsRow(),
      ),
    );
  }
}
