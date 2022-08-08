import 'package:flutter/material.dart';

class LessonCard extends StatelessWidget {
  const LessonCard({
    Key? key,
    required this.id,
    required this.lessonTitle,
    required this.duration,
    required this.isLock,
    required this.textTheme,
    required this.primaryColor,
  }) : super(key: key);

  final String id;
  final String lessonTitle;
  final String duration;
  final bool isLock;
  final TextTheme textTheme;
  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.01,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: MediaQuery.of(context).size.width * 0.08,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          child: Text(
            id,
            style: textTheme.headline6?.copyWith(color: primaryColor),
          ),
        ),
        title: Text(
          lessonTitle,
          style: textTheme.bodyText2?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          duration,
          style: textTheme.overline?.copyWith(color: const Color(0xff616161)),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(
            isLock ? Icons.lock_outline : Icons.play_circle_fill_rounded,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
