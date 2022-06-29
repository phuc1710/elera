import 'package:flutter/material.dart';

import '../../../../data/models/course/course_response_model.dart';
import '../../search/widgets/bottom_modal_sheet_title.dart';
import 'bottom_sheet_action_button.dart';
import 'course_card.dart';

class BookmarkButton extends StatefulWidget {
  const BookmarkButton({
    Key? key,
    required this.courseModel,
    required this.isInRemoveBookmark,
    required this.onRemoveBookmark,
  }) : super(key: key);

  final CourseModelItem courseModel;
  final bool isInRemoveBookmark;
  final VoidCallback onRemoveBookmark;

  @override
  State<BookmarkButton> createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              if (widget.courseModel.isBookmarked) {
                showBookmarkRemoveBottomSheet(context);
              }
              if (!widget.courseModel.isBookmarked)
                setState(() {
                  widget.courseModel.isBookmarked = true;
                  if (!bookmarkList.contains(widget.courseModel))
                    bookmarkList.add(widget.courseModel);
                });
            },
            child: Icon(
              widget.courseModel.isBookmarked
                  ? Icons.bookmark
                  : Icons.bookmark_outline,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  dynamic showBookmarkRemoveBottomSheet(BuildContext context) {
    return showModalBottomSheet<dynamic>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const BottomModalSheetTitle(title: 'Remove from bookmark?'),
              const Divider(),
              CourseCard(
                courseModel: widget.courseModel,
                isInRemoveBookmark: true,
                onRemoveBookmark: () {},
              ),
              BottomSheetActionButtons(
                mainButtonString: 'Yes, Remove',
                subButtonString: 'Cancel',
                courseModel: widget.courseModel,
                onMainActionPressed: widget.onRemoveBookmark,
              )
            ],
          ),
        );
      },
    );
  }
}
