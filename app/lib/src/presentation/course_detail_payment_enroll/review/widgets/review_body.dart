import 'package:flutter/material.dart';

import 'review_tab_view.dart';

class ReviewBody extends StatelessWidget {
  const ReviewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: const ReviewsTabView(),
      ),
    );
  }
}
