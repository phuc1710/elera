import 'package:flutter/material.dart';

import '../../../data/models/friends/friend_response_model.dart';
import '../../widgets/base_button.dart';

class FriendTile extends StatefulWidget {
  const FriendTile({
    Key? key,
    required this.friend,
    required this.onInvited,
  }) : super(key: key);

  final FriendModel? friend;
  final Function() onInvited;

  @override
  State<FriendTile> createState() => _FriendTileState();
}

class _FriendTileState extends State<FriendTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        widget.friend?.img ?? '',
        width: 50,
        height: 50,
      ),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Text(
          widget.friend?.name ?? '',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.black),
        ),
      ),
      subtitle: Text(
        widget.friend?.phone ?? '',
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: Colors.black, fontSize: 14),
      ),
      trailing: SizedBox(
        width: 55,
        height: 30,
        child: BaseButton(
          title: isInvited ? 'Invited' : 'Invite',
          color: isInvited ? Colors.white : Theme.of(context).primaryColor,
          borderColor:
              isInvited ? Theme.of(context).primaryColor : Colors.white,
          titleColor: isInvited ? Theme.of(context).primaryColor : Colors.white,
          borderRadius: 20,
          onTap: widget.onInvited,
        ),
      ),
    );
  }

  bool get isInvited => widget.friend?.isInvited == true;
}
