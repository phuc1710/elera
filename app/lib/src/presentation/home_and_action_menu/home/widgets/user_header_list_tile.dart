import 'package:flutter/material.dart';

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
          radius: 25,
        ),
        minLeadingWidth: 0,
        contentPadding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.02,
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Text(
            'Good Morning 👋',
            style: Theme.of(context)
                .textTheme
                .caption
                ?.copyWith(color: const Color(0xff757575)),
          ),
        ),
        subtitle: Text(
          'Andrew Ainsley',
          style: Theme.of(context)
              .textTheme
              .bodyText2
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        trailing: const TrailingButtonsRow(),
      ),
    );
  }
}
