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
            const BottomModalSheetTitle(title: 'Filter'),
            const Divider(),
            const SectionText(text: 'Category'),
            const CourseFilterChips(),
            const SectionText(text: 'Price'),
            const PriceRangeSlider(),
            const SectionText(text: 'Rating'),
            StarFilterChips(selectedCallbackAction: (value) {}),
            const Divider(),
            BottomSheetActionButtons(
              onMainActionPressed: () {},
              mainButtonString: 'Filter',
              subButtonString: 'Reset',
            )
          ],
        ),
      ),
    );
  }
}
