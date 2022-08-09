import 'package:flutter/material.dart';

import '../../../home_and_action_menu/search/widgets/star_filter_chips.dart';
import '../../course_detail/widgets/review_list_tile.dart';

class ReviewsTabView extends StatelessWidget {
  const ReviewsTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        StarFilterChips(),
        ReviewListTile(),
        ReviewListTile(),
        ReviewListTile(),
      ],
    );
  }
}
