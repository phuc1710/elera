import 'package:flutter/material.dart';

import 'action_button_row.dart';
import 'mentor_detail_tab_bar_view.dart';
import 'mentor_extra_info.dart';
import 'mentor_info_column.dart';

class MentorProfileBody extends StatelessWidget {
  const MentorProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Column(
          children: [
            const MentorInfoColumn(),
            const MentorExtraInfo(),
            const ActionButtonsRow(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
              child: const Divider(),
            ),
            const MentorDetailTabBarView()
          ],
        ),
      ),
    );
  }
}
