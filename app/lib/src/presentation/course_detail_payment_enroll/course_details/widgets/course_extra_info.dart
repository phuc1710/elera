import 'package:flutter/material.dart';

class CourseExtraInfo extends StatelessWidget {
  const CourseExtraInfo({Key? key, this.enrollCount, this.totalTime})
      : super(key: key);

  final String? enrollCount;
  final String? totalTime;

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
          Text('$enrollCount students', style: textTheme.caption),
          Icon(Icons.timer, color: primaryColor),
          Text('$totalTime Hours', style: textTheme.caption),
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
