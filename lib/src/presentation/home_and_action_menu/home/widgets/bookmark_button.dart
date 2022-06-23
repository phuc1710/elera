import 'package:flutter/material.dart';

import '../../../../models/course/course_model.dart';
import '../../../onboarding/intro/widgets/main_action_ink.dart';
import 'course_card.dart';

class BookmarkButton extends StatefulWidget {
  const BookmarkButton({
    Key? key,
    required this.courseModel,
    required this.isInRemoveBookmark,
    required this.onRemoveBookmark,
  }) : super(key: key);

  final CourseModel courseModel;
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
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.025,
                ),
                child: Text(
                  'Remove from Bookmark?',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              const Divider(),
              CourseCard(
                courseModel: widget.courseModel,
                isInRemoveBookmark: true,
                onRemoveBookmark: () {},
              ),
              BottomSheetActionButtons(
                courseModel: widget.courseModel,
                onRemoveBookmark: widget.onRemoveBookmark,
              )
            ],
          ),
        );
      },
    );
  }
}

class BottomSheetActionButtons extends StatefulWidget {
  const BottomSheetActionButtons({
    Key? key,
    required this.courseModel,
    required this.onRemoveBookmark,
  }) : super(key: key);

  final CourseModel courseModel;
  final VoidCallback onRemoveBookmark;

  @override
  State<BottomSheetActionButtons> createState() =>
      _BottomSheetActionButtonsState();
}

class _BottomSheetActionButtonsState extends State<BottomSheetActionButtons> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.02,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(40),
            onTap: () {
              Navigator.pop(context);
            },
            child: const MainActionInk(
              buttonString: 'Cancel',
              width: 0.4,
              isMainAction: true,
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(40),
            onTap: () {
              setState(() {
                widget.courseModel.isBookmarked =
                    !widget.courseModel.isBookmarked;
              });
              widget.onRemoveBookmark();
              Navigator.pop(context);
            },
            child: const MainActionInk(
              buttonString: 'Yes, Remove',
              width: 0.42,
            ),
          )
        ],
      ),
    );
  }
}
