import 'package:flutter/material.dart';

import '../../my_bookmark/views/my_bookmark_view.dart';
import '../../notification/views/notification_view.dart';

class TrailingButtonsRow extends StatelessWidget {
  const TrailingButtonsRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.notifications_none),
          onPressed: () {
            Navigator.push<Object>(
              context,
              MaterialPageRoute(builder: (builder) => const NotificationView()),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.bookmark_border),
          onPressed: () {
            Navigator.push<Object>(
              context,
              MaterialPageRoute(builder: (builder) => const MyBookmarkView()),
            );
          },
        ),
      ],
    );
  }
}
