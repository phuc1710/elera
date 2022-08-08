import 'package:flutter/material.dart';

class MentorListTile extends StatelessWidget {
  const MentorListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      borderRadius: BorderRadius.circular(30.0),
      onTap: () {},
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          radius: MediaQuery.of(context).size.width * 0.08,
          backgroundColor: Theme.of(context).colorScheme.secondary,
        ),
        title: Text(
          'Jonathan',
          style: textTheme.bodyText2?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'Senior',
          style: textTheme.overline?.copyWith(color: const Color(0xff616161)),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.chat_bubble_outline,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
