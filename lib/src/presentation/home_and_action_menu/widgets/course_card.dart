import 'package:flutter/material.dart';

import 'bookmark_button.dart';
import 'course_content_column.dart';
import 'course_image.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    Key? key,
    required this.imagePath,
    required this.tag,
    required this.name,
    required this.price,
    required this.originalPrice,
    required this.rating,
    required this.studentCount,
  }) : super(key: key);

  final String imagePath;
  final String tag;
  final String name;
  final String price;
  final String originalPrice;
  final double rating;
  final String studentCount;

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
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.04,
          vertical: MediaQuery.of(context).size.height * 0.02,
        ),
        child: Row(
          children: [
            CourseImage(
              imagePath: imagePath,
            ),
            CourseContentColumn(
              tag: tag,
              name: name,
              price: price,
              originalPrice: originalPrice,
              rating: rating,
              studentCount: studentCount,
            ),
            const BookmarkButton(),
          ],
        ),
      ),
    );
  }
}
