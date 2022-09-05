import 'package:flutter/material.dart';

import 'mentor_detail.dart';

class MentorExtraInfo extends StatelessWidget {
  const MentorExtraInfo({
    Key? key,
    this.courseCount,
    this.studentCount,
    this.reviewCount,
  }) : super(key: key);

  final int? courseCount;
  final int? studentCount;
  final int? reviewCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MentorDetail(value: courseCount, unit: 'Courses'),
            const VerticalDivider(width: 4),
            const MentorDetail(value: 22379, unit: 'Students'),
            const VerticalDivider(width: 4),
            const MentorDetail(value: 9287, unit: 'Reviews')
          ],
        ),
      ),
    );
  }
}
