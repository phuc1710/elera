import 'package:flutter/material.dart';

import 'star_chip.dart';

class ReviewerListTile extends StatelessWidget {
  const ReviewerListTile({Key? key, this.fullName, this.rating, this.avatar})
      : super(key: key);

  final String? fullName;
  final int? rating;
  final String? avatar;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final secondaryColor = Theme.of(context).colorScheme.secondary;
    final screenWidth = MediaQuery.of(context).size.width;

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: screenWidth * 0.08,
        backgroundColor: secondaryColor,
        foregroundImage: avatar == null ? null : Image.network('$avatar').image,
      ),
      title: Text(
        '$fullName',
        style: textTheme.bodyText2?.copyWith(fontWeight: FontWeight.bold),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          StarChip(rating: rating),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
        ],
      ),
    );
  }
}
