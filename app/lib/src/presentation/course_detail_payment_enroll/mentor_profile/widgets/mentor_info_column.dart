import 'package:flutter/material.dart';

class MentorInfoColumn extends StatelessWidget {
  const MentorInfoColumn({
    Key? key,
    this.fullName,
    this.description,
    this.avatar,
  }) : super(key: key);

  final String? fullName;
  final String? description;
  final String? avatar;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final secondaryColor = Theme.of(context).colorScheme.secondary;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        CircleAvatar(
          backgroundColor: secondaryColor,
          radius: screenHeight * 0.08,
          backgroundImage: avatar == null
              ? null
              : Image.network('$avatar', width: screenWidth * 0.08).image,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('$fullName', style: textTheme.headline6),
        ),
        Text('$description', style: textTheme.caption),
      ],
    );
  }
}
