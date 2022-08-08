import 'package:flutter/material.dart';

class CourseTitle extends StatelessWidget {
  const CourseTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final textTheme = Theme.of(context).textTheme;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.01,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Intro to UI/UX Design',
            style: textTheme.headline6,
          ),
          Icon(
            Icons.bookmark_outline,
            color: primaryColor,
          )
        ],
      ),
    );
  }
}
