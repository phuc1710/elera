import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../config/router/routes.dart';

class CallListTile extends StatelessWidget {
  const CallListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final textTheme = Theme.of(context).textTheme;

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: MediaQuery.of(context).size.width * 0.08,
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      title: Text(
        'Roselle Ehrman',
        style: textTheme.bodyText2?.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Row(
        children: [
          Icon(IconlyBold.arrow_down_square, size: 16, color: primaryColor),
          Text(
            ' Incoming | Dec 19, 2024',
            style:
                textTheme.overline?.copyWith(color: const Color(0xff616161)),
          ),
        ],
      ),
      trailing: IconButton(
        onPressed: () => context.router.pushNamed(Routes.call),
        icon: const Icon(IconlyLight.call),
        color: primaryColor,
      ),
    );
  }
}
