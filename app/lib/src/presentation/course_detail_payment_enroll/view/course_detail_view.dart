import 'package:flutter/material.dart';

import '../widgets/course_detail_tab_bar_view.dart';
import '../widgets/course_extra_info.dart';
import '../widgets/course_tag_and_review.dart';
import '../widgets/course_title.dart';
import '../widgets/enroll_button.dart';
import '../widgets/price_row.dart';

class CourseDetailView extends StatelessWidget {
  const CourseDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.85,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppBar(
                    flexibleSpace: Image.asset('assets/images/not_found.png'),
                    elevation: 0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CourseTitle(),
                        const CourseTagAndReview(),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.01,
                          ),
                          child: const PriceRow(
                            price: r'$40',
                            originalPrice: r'$75',
                          ),
                        ),
                        const CourseExtraInfo(),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.01,
                          ),
                          child: const Divider(),
                        ),
                        const CourseDetailTabBarView()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const EnrollButton()
        ],
      ),
    );
  }
}
