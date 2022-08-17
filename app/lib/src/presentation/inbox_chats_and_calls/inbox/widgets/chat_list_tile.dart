import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../config/router/routes.dart';

class ChatListTile extends StatelessWidget {
  const ChatListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      borderRadius: BorderRadius.circular(30.0),
      onTap: () => context.router.pushNamed(Routes.chat),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          radius: MediaQuery.of(context).size.width * 0.08,
          backgroundColor: Theme.of(context).colorScheme.secondary,
        ),
        title: Text(
          'Jenny Wilona',
          style: textTheme.bodyText2?.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Hi, good morning too!',
          style: textTheme.overline?.copyWith(color: const Color(0xff616161)),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 10,
              backgroundColor: primaryColor,
              child: Text(
                '2',
                style: textTheme.overline?.copyWith(color: Colors.white),
              ),
            ),
            Text(
              '13:29',
              style:
                  textTheme.overline?.copyWith(color: const Color(0xff616161)),
            )
          ],
        ),
      ),
    );
  }
}
