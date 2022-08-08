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
              .bodyText2
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      subtitle: Text(
        widget.friend?.phone ?? '',
        style: Theme.of(context).textTheme.overline?.copyWith(
              fontSize: 11,
              color: const Color(0xff616161),
            ),
      ),
      trailing: SizedBox(
        width: 80,
        height: 35,
        child: BaseButton(
          title: isInvited ? 'Invited' : 'Invite',
          color: isInvited ? Colors.white : Theme.of(context).primaryColor,
          borderColor:
              isInvited ? Theme.of(context).primaryColor : Colors.white,
          titleColor: isInvited ? Theme.of(context).primaryColor : Colors.white,
          borderRadius: 20,
          onTap: widget.onInvited,
          shadow: const [
            BoxShadow(
              color: Color.fromRGBO(51, 94, 247, 0.25),
              blurRadius: 24,
              offset: Offset(4, 8),
            )
          ],
        ),
      ),
    );
  }

  bool get isInvited => widget.friend?.isInvited == true;
}
