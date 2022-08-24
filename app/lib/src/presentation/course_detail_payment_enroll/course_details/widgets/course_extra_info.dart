import 'package:flutter/material.dart';

class CourseExtraInfo extends StatelessWidget {
  const CourseExtraInfo({Key? key}) : super(key: key);

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
          Icon(Icons.people, color: primaryColor),
          Text(
            '9,839 students',
            style: textTheme.caption,
          ),
          Icon(Icons.timer, color: primaryColor),
          Text('2,5 Hours', style: textTheme.caption),
          Icon(
            Icons.document_scanner,
            color: primaryColor,
          ),
          Text('Certificate', style: textTheme.caption),
        ],
      ),
    );
  }
}
