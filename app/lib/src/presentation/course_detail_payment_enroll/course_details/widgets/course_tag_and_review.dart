import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';

import '../../../home_and_action_menu/home/widgets/course_tag.dart';

class CourseTagAndReview extends StatelessWidget {
  const CourseTagAndReview({Key? key, this.tag, this.rating, this.reviewCount})
      : super(key: key);

  final String? tag;
  final String? rating;
  final String? reviewCount;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
      child: Row(
        children: [
          CourseTag(tag: '$tag'),
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Icon(
              Icons.star_half_rounded,
              color: Color(0xfffc9a0e),
              size: 18,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              '$rating ($reviewCount ${AppLocalizations.of(context).reviews})',
              style:
                  textTheme.caption?.copyWith(color: const Color(0xff616161)),
            ),
          ),
        ],
      ),
    );
  }
}
