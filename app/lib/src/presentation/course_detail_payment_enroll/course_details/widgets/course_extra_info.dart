import 'package:ez_intl/ez_intl.dart';
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
    final l10n = AppLocalizations.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.01,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.people, color: primaryColor),
          Text('$enrollCount ${l10n.students}', style: textTheme.caption),
          Icon(Icons.timer, color: primaryColor),
          Text('$totalTime ${l10n.hours}', style: textTheme.caption),
          Icon(
            Icons.document_scanner,
            color: primaryColor,
          ),
          Text(l10n.certificate, style: textTheme.caption),
        ],
      ),
    );
  }
}
