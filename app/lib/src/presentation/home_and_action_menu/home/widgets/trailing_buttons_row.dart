import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/router/routes.dart';
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
          onPressed: () => context.router.pushNamed(Routes.notification),
        ),
        IconButton(
          icon: const Icon(Icons.bookmark_border),
          onPressed: () {
            context.router
                .pushNamed(Routes.myBookmark)
                .then((value) => context.read<HomeBloc>().add(HomeFetched()));
          },
        ),
      ],
    );
  }
}
