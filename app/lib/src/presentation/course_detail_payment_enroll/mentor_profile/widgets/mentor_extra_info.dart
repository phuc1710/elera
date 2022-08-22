import 'package:flutter/material.dart';

class MentorExtraInfo extends StatelessWidget {
  const MentorExtraInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('25', style: textTheme.headline6),
                ),
                Text('Courses', style: textTheme.caption),
              ],
            ),
            const VerticalDivider(width: 4),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('22,379', style: textTheme.headline6),
                ),
                Text('Students', style: textTheme.caption),
              ],
            ),
            const VerticalDivider(width: 4),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('9,287', style: textTheme.headline6),
                ),
                Text('Reviews', style: textTheme.caption),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
