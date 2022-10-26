import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';

import 'mentor_detail.dart';

class MentorExtraInfo extends StatelessWidget {
  const MentorExtraInfo({
    Key? key,
    this.courseCount,
    this.studentCount,
    this.reviewCount,
  }) : super(key: key);

  final int? courseCount;
  final int? studentCount;
  final int? reviewCount;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MentorDetail(value: courseCount, unit: l10n.courses),
            const VerticalDivider(width: 4),
            MentorDetail(value: 22379, unit: l10n.studentsCap),
            const VerticalDivider(width: 4),
            MentorDetail(value: 9287, unit: l10n.reviewsCap)
          ],
        ),
      ),
    );
  }
}
