import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/course_details/course_details_fetch_response_model.dart';
import '../../../home_and_action_menu/home/widgets/section_text.dart';
import 'mentor_list_tile.dart';

class AboutTabView extends StatelessWidget {
  const AboutTabView({Key? key, this.courseData}) : super(key: key);

  final Data? courseData;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final textTheme = Theme.of(context).textTheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final l10n = AppLocalizations.of(context);

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: SectionText(text: l10n.mentor),
        ),
        MentorListTile(mentorData: courseData?.mentor),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: SectionText(text: l10n.aboutCourse),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: courseData?.aboutCourse,
                style: textTheme.overline
                    ?.copyWith(fontSize: 13, color: const Color(0xff616161)),
              ),
              TextSpan(
                text: ' ${l10n.readMore}',
                style: textTheme.overline?.copyWith(
                  fontSize: 13,
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: SectionText(text: l10n.tools),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: courseData?.tools?[0].icon == null
                  ? Image.asset('facebook_logo.png')
                  : Image.network(
                      '${courseData?.tools?[0].icon}',
                      width: screenWidth * 0.08,
                    ),
            ),
            Text(
              '${courseData?.tools?[0].name}',
              style: textTheme.caption?.copyWith(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ],
    );
  }
}
