import 'package:flutter/material.dart';

import '../../../../data/models/course/course_fetch_response_model.dart';
import 'bookmark_button.dart';
import 'course_content_column.dart';
import 'course_image.dart';

class CourseCard extends StatefulWidget {
  const CourseCard({
    Key? key,
    required this.courseModel,
    required this.isInRemoveBookmark,
    required this.onRemoveBookmark,
  }) : super(key: key);

  final Course? courseModel;
  final bool isInRemoveBookmark;
  final VoidCallback onRemoveBookmark;

  @override
  State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.01,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.04,
          vertical: MediaQuery.of(context).size.height * 0.02,
        ),
        child: Row(
          children: [
            CourseImage(
              imagePath: widget.courseModel?.imagePath ?? '',
            ),
            CourseContentColumn(
              tag: widget.courseModel?.tag ?? '',
              name: widget.courseModel?.name ?? '',
              price: widget.courseModel?.price ?? '',
              originalPrice: widget.courseModel?.originalPrice ?? '',
              rating: widget.courseModel?.rating ?? 0,
              studentCount: widget.courseModel?.studentCount ?? '',
            ),
            if (widget.isInRemoveBookmark)
              SizedBox(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Icon(Icons.bookmark),
                  ],
                ),
              )
            else
              BookmarkButton(
                courseModel: widget.courseModel,
                isInRemoveBookmark: widget.isInRemoveBookmark,
                onRemoveBookmark: () {
                  widget.onRemoveBookmark();
                },
              ),
          ],
        ),
      ),
    );
  }
}
