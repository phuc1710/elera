// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:

class ProfilePicture extends StatefulWidget {
  const ProfilePicture({Key? key, required this.avatar, required this.callBack})
      : super(key: key);

  final String? avatar;
  final Function() callBack;

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  @override
  Widget build(BuildContext context) {
    return buildProfilePicture();
  }

  Widget buildProfilePicture() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            buildPicture(),
            Positioned(
              top: 95,
              right: 8,
              child: GestureDetector(
                child: const Icon(Icons.edit, size: 22),
                onTap: () => widget.callBack.call(),
              ),
            ),
          ],
        ),
      ],
    );
  }


  Widget buildPicture() {
    return SizedBox(
      width: 120.0,
      height: 120.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.network(widget.avatar ?? ''),
      ),
    );
  }
}
