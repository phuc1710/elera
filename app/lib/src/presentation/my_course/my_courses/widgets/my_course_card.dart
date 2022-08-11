import 'package:flutter/material.dart';

import 'course_image.dart';
import 'course_progress_indicator.dart';

class MyCourseCard extends StatelessWidget {
  const MyCourseCard({
    Key? key,
    required this.imagePath,
    required this.courseTitle,
    required this.time,
    required this.value,
    required this.action,
  }) : super(key: key);

  final String imagePath;
  final String courseTitle;
  final String time;
  final double value;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: action,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04,
            vertical: screenHeight * 0.02,
          ),
          child: Row(
            children: [
              CourseImage(imagePath: imagePath),
              SizedBox(
                width: screenWidth * 0.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      courseTitle,
                      style: textTheme.bodyText2
                          ?.copyWith(fontWeight: FontWeight.bold),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        time,
                        style: textTheme.overline
                            ?.copyWith(color: const Color(0xff616161)),
                      ),
                    )
                  ],
                ),
              ),
              CourseProgressIndicator(value: value),
            ],
          ),
        ),
      ),
    );
  }
}
