import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../my_bookmark/views/my_bookmark_view.dart';
import '../../notification/views/notification_view.dart';
import '../bloc/home_bloc.dart';

class TrailingButtonsRow extends StatefulWidget {
  const TrailingButtonsRow({
    Key? key,
  }) : super(key: key);

  @override
  State<TrailingButtonsRow> createState() => _TrailingButtonsRowState();
}

class _TrailingButtonsRowState extends State<TrailingButtonsRow> {
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
            ).then((value) => context.read<HomeBloc>().add(HomeFetched()));
          },
        ),
      ],
    );
  }
}
