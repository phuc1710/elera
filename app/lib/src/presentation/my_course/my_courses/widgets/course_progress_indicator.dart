import 'package:flutter/material.dart';

class CourseProgressIndicator extends StatelessWidget {
  const CourseProgressIndicator({Key? key, required this.value})
      : super(key: key);

  final double value;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox.square(
            dimension: 70,
            child: CircularProgressIndicator(
              value: value,
              strokeWidth: 8,
              valueColor: AlwaysStoppedAnimation(getColor(context, value)),
              backgroundColor: const Color(0xffeeeeee),
            ),
          ),
          Text(
            '${(value * 100).floor()}%',
            style: textTheme.bodyText2?.copyWith(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Color? getColor(BuildContext context, double value) {
    if (value == 1) {
      return Theme.of(context).colorScheme.primary;
    } else if (value >= 0.75) {
      return const Color(0xffff5870);
    } else if (value > 0.50) {
      return const Color(0xfffc9809);
    } else if (value > 0.25) {
      return const Color(0xfffbd027);
    } else {
      return const Color(0xff27c5a5);
    }
  }
}
