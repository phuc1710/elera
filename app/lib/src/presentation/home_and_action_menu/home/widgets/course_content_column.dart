import 'package:flutter/material.dart';

import 'course_tag.dart';
import 'price_row.dart';

class CourseContentColumn extends StatelessWidget {
  const CourseContentColumn({
    Key? key,
    required this.name,
    required this.tag,
    required this.price,
    required this.originalPrice,
    required this.rating,
    required this.studentCount,
  }) : super(key: key);

  final String tag;
  final String name;
  final String price;
  final String originalPrice;
  final double rating;
  final String studentCount;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CourseTag(tag: tag),
            Text(
              name.replaceAll('', '\u{200B}'),
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              style: textTheme.bodyText2?.copyWith(fontWeight: FontWeight.bold),
            ),
            PriceRow(price: price, originalPrice: originalPrice),
            Text(
              '⭐  $rating  |  $studentCount students',
              style:
                  textTheme.overline?.copyWith(color: const Color(0xff616161)),
            ),
          ],
        ),
      ),
    );
  }
}
