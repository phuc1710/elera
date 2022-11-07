import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../config/router/app_router.dart';

class ChatListTile extends StatelessWidget {
  const ChatListTile({
    Key? key,
    this.avatar,
    this.name,
    this.unreadMessages,
    this.lastMessage,
    this.laseMessageTime,
  }) : super(key: key);

  final String? avatar;
  final String? name;
  final int? unreadMessages;
  final String? lastMessage;
  final String? laseMessageTime;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      borderRadius: BorderRadius.circular(30.0),
      onTap: () => context.router.push(ChatRoute(username: name)),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          radius: MediaQuery.of(context).size.width * 0.08,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          backgroundImage:
              avatar == null ? null : Image.network('$avatar').image,
        ),
        title: Text(
          '$name',
          style: textTheme.bodyText2?.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '$lastMessage',
          style: textTheme.overline?.copyWith(color: const Color(0xff616161)),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 10,
              backgroundColor: primaryColor,
              child: Text(
                '$unreadMessages',
                style: textTheme.overline?.copyWith(color: Colors.white),
              ),
            ),
            Text(
              '$laseMessageTime',
              style:
                  textTheme.overline?.copyWith(color: const Color(0xff616161)),
            )
          ],
        ),
      ),
    );
  }
}
