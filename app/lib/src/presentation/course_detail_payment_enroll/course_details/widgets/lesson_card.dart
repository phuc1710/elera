import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../config/router/app_router.dart';

class LessonCard extends StatelessWidget {
  const LessonCard({
    Key? key,
    required this.courseId,
    required this.id,
    required this.order,
    required this.lessonTitle,
    required this.duration,
    required this.isLock,
    this.videoLink,
    this.currentTime,
  }) : super(key: key);

  final String courseId;
  final String id;
  final String order;
  final String lessonTitle;
  final String duration;
  final bool isLock;
  final String? videoLink;
  final int? currentTime;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      elevation: 5,
      shadowColor: Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.01,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: MediaQuery.of(context).size.width * 0.08,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          child: Text(
            order,
            style: textTheme.headline6?.copyWith(color: primaryColor),
          ),
        ),
        title: Text(
          lessonTitle,
          style: textTheme.bodyText2?.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          duration,
          style: textTheme.overline?.copyWith(color: const Color(0xff616161)),
        ),
        trailing: isLock
            ? const Icon(IconlyLight.lock)
            : IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () => context.router.push(
                  CourseVideoRoute(
                    courseId: courseId,
                    lessonId: id,
                    videoLink: videoLink,
                    currentTime: currentTime,
                  ),
                ),
                icon: Icon(Icons.play_circle_fill_rounded, color: primaryColor),
              ),
      ),
    );
  }
}
