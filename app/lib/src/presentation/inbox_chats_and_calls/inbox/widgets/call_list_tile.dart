import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../config/router/routes.dart';

class CallListTile extends StatelessWidget {
  const CallListTile({
    Key? key,
    this.avatar,
    this.name,
    this.lastCallType,
    this.lastCallTime,
  }) : super(key: key);

  final String? avatar;
  final String? name;
  final String? lastCallType;
  final String? lastCallTime;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final textTheme = Theme.of(context).textTheme;

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: MediaQuery.of(context).size.width * 0.08,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        backgroundImage: avatar == null ? null : Image.network('$avatar').image,
      ),
      title: Text(
        '$name',
        style: textTheme.bodyText2?.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Row(
        children: [
          getLastCallTypeIcon(context, lastCallType),
          Text(
            ' $lastCallType | $lastCallTime',
            style: textTheme.overline?.copyWith(color: const Color(0xff616161)),
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

  Icon getLastCallTypeIcon(BuildContext context, String? lastCallType) {
    switch (lastCallType) {
      case 'Incoming':
        return const Icon(
          IconlyBold.arrow_down_square,
          size: 16,
          color: Color(0xff396dff),
        );
      case 'Missed':
        return const Icon(
          IconlyBold.close_square,
          size: 16,
          color: Color(0xffed5352),
        );
      case 'Outgoing':
        return const Icon(
          IconlyBold.arrow_up_square,
          size: 16,
          color: Color(0xff63de7c),
        );
      default:
        return Icon(
          Icons.square_rounded,
          size: 16,
          color: Theme.of(context).colorScheme.primary,
        );
    }
  }
}
