import 'package:flutter/material.dart';

import '../../home_and_action_menu/home/widgets/course_tag.dart';

class CourseTagAndReview extends StatelessWidget {
  const CourseTagAndReview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.01,
      ),
      child: Row(
        children: [
          const CourseTag(tag: 'UI/UX Design'),
          Text(
            '⭐  4.8 (4,479 reviews)',
            style: textTheme.overline?.copyWith(color: const Color(0xff616161)),
          ),
        ],
      ),
    );
  }
}
