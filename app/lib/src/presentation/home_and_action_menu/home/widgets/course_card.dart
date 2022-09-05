import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../config/router/app_router.dart';
import '../../../../data/models/course/course_fetch_response_model.dart';
import 'bookmark_button.dart';
import 'course_content_column.dart';
import 'course_image.dart';

class CourseCard extends StatefulWidget {
  const CourseCard({
    Key? key,
    required this.courseModel,
    required this.isInRemoveBookmark,
    required this.onAddBookmark,
    required this.onRemoveBookmark,
  }) : super(key: key);

  final Course? courseModel;
  final bool isInRemoveBookmark;
  final VoidCallback onAddBookmark;
  final VoidCallback onRemoveBookmark;

  @override
  State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Card(
      elevation: 2,
      shadowColor: Colors.grey[200],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
        onTap: widget.isInRemoveBookmark
            ? () {}
            : () => context.router
                .push(CourseDetailsRoute(courseId: '62cfe28220ef7d2084494478')),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04,
            vertical: screenHeight * 0.02,
          ),
          child: Row(
            children: [
              CourseImage(imagePath: '${widget.courseModel?.image}'),
              CourseContentColumn(
                tag: '${widget.courseModel?.categoryName}',
                name: '${widget.courseModel?.name}',
                price: '\$${widget.courseModel?.discountPrice?.en}',
                originalPrice: '\$${widget.courseModel?.originalPrice?.en}',
                rating: widget.courseModel?.rating ?? 0,
                studentCount: '${widget.courseModel?.enrollCount}',
              ),
              if (widget.isInRemoveBookmark)
                SizedBox(
                  height: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [Icon(Icons.bookmark)],
                  ),
                )
              else
                BookmarkButton(
                  courseModel: widget.courseModel,
                  isInRemoveBookmark: widget.isInRemoveBookmark,
                  onAddBookmark: () => widget.onAddBookmark(),
                  onRemoveBookmark: () => widget.onRemoveBookmark(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
