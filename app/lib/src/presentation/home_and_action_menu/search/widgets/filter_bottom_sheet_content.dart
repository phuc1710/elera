import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';

import '../../home/widgets/bottom_sheet_action_button.dart';
import '../../home/widgets/section_text.dart';
import 'bottom_modal_sheet_title.dart';
import 'course_filter_chips.dart';
import 'price_range_slider.dart';
import 'star_filter_chips.dart';

class FilterBottomSheetContent extends StatelessWidget {
  const FilterBottomSheetContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BottomModalSheetTitle(title: l10n.filter),
            const Divider(),
            SectionText(text: l10n.category),
            const CourseFilterChips(),
            SectionText(text: l10n.price),
            const PriceRangeSlider(),
            SectionText(text: l10n.rating),
            StarFilterChips(selectedCallbackAction: (value) {}),
            const Divider(),
            BottomSheetActionButtons(
              onMainActionPressed: () {},
              mainButtonString: l10n.filter,
              subButtonString: l10n.reset,
            )
          ],
        ),
      ),
    );
  }
}
