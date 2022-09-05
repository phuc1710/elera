import 'package:flutter/material.dart';

import '../../course_details/widgets/review_list_tile.dart';

class ReviewsTabView extends StatelessWidget {
  const ReviewsTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return ListView(
      padding: EdgeInsets.only(
        top: 8.0,
        bottom: screenHeight * 0.15,
        left: screenWidth * 0.05,
        right: screenWidth * 0.05,
      ),
      physics: const ClampingScrollPhysics(),
      children: const [
        ReviewListTile(),
        ReviewListTile(),
        ReviewListTile(),
      ],
    );
  }
}
