import 'package:flutter/material.dart';

import 'star_chip.dart';

class ReviewerListTile extends StatelessWidget {
  const ReviewerListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: MediaQuery.of(context).size.width * 0.08,
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      title: Text(
        'Marielle',
        style: textTheme.bodyText2?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const StarChip(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz),
          ),
        ],
      ),
    );
  }
}
