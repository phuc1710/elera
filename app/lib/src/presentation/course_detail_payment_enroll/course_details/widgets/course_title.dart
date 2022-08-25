import 'package:flutter/material.dart';

class CourseTitle extends StatelessWidget {
  const CourseTitle({
    Key? key,
    this.title,
  }) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final textTheme = Theme.of(context).textTheme;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: screenWidth * 0.7,
            child: Text(
              '$title',
              style: textTheme.headline4?.copyWith(fontSize: 26),
            ),
          ),
          Icon(Icons.bookmark_outline, color: primaryColor)
        ],
      ),
    );
  }
}
