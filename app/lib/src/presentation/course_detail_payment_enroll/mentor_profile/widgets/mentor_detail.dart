import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MentorDetail extends StatelessWidget {
  const MentorDetail({Key? key, this.value, this.unit}) : super(key: key);

  final int? value;
  final String? unit;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final f = NumberFormat('#,###');

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value != null ? f.format(value) : '0',
            style: textTheme.headline6,
          ),
        ),
        Text('$unit', style: textTheme.caption),
      ],
    );
  }
}
