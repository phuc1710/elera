import 'package:flutter/material.dart';

import '../../course_details/widgets/review_list_tile.dart';

class ReviewsTabView extends StatelessWidget {
  const ReviewsTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ReviewListTile(),
        ReviewListTile(),
        ReviewListTile(),
      ],
    );
  }
}
