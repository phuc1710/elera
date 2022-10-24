import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../data/models/course/course_fetch_response_model.dart';
import '../../search/widgets/bottom_modal_sheet_title.dart';
import 'bottom_sheet_action_button.dart';
import 'course_card.dart';

class BookmarkButton extends StatefulWidget {
  const BookmarkButton({
    Key? key,
    required this.courseModel,
    required this.isInRemoveBookmark,
    required this.onRemoveBookmark,
    required this.onAddBookmark,
  }) : super(key: key);

  final Course? courseModel;
  final bool isInRemoveBookmark;
  final VoidCallback onAddBookmark;
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
              if (widget.courseModel?.isBookmarked ?? true) {
                showBookmarkRemoveBottomSheet(context);
              }
              if (!(widget.courseModel?.isBookmarked ?? false)) {
                widget.onAddBookmark();
                setState(() {
                  widget.courseModel?.isBookmarked = true;
                });
              }
            },
            child: Icon(
              widget.courseModel?.isBookmarked ?? false
                  ? IconlyBold.bookmark
                  : IconlyLight.bookmark,
              color: Theme.of(context).colorScheme.primary,
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
        final l10n = AppLocalizations.of(context);

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BottomModalSheetTitle(title: l10n.removeFromBookmark),
              const Divider(),
              CourseCard(
                courseModel: widget.courseModel,
                isInRemoveBookmark: true,
                onAddBookmark: () {},
                onRemoveBookmark: () {},
              ),
              BottomSheetActionButtons(
                mainButtonString: l10n.yesRemove,
                subButtonString: l10n.cancel,
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
