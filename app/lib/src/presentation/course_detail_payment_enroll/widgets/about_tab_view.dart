import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../home_and_action_menu/home/widgets/section_text.dart';
import 'mentor_list_tile.dart';

class AboutTabView extends StatelessWidget {
  const AboutTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: SectionText(text: 'Mentor'),
        ),
        const MentorListTile(),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: SectionText(
            text: 'About Course',
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
          \nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip''',
                style: textTheme.overline
                    ?.copyWith(fontSize: 13, color: const Color(0xff616161)),
              ),
              TextSpan(
                text: ' Read more ...',
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
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: SectionText(text: 'Tools'),
        ),
        Row(
          children: const [Icon(Icons.adobe), Text('Figma')],
        ),
      ],
    );
  }
}
