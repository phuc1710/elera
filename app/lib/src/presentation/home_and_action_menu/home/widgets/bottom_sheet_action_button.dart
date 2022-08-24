import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/course/course_fetch_response_model.dart';
import '../../../widgets/main_action_ink.dart';

class BottomSheetActionButtons extends StatefulWidget {
  const BottomSheetActionButtons({
    Key? key,
    required this.mainButtonString,
    required this.subButtonString,
    this.courseModel,
    required this.onMainActionPressed,
  }) : super(key: key);

  final String mainButtonString;
  final String subButtonString;
  final Item? courseModel;
  final VoidCallback onMainActionPressed;

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
            onTap: () => context.router.pop(),
            child: MainActionInk(
              buttonString: widget.subButtonString,
              width: 0.4,
              isMainAction: true,
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(40),
            onTap: () {
              setState(() {
                widget.courseModel?.isBookmarked =
                    widget.courseModel?.isBookmarked ?? false;
              });
              widget.onMainActionPressed();
              context.router.pop();
            },
            child: MainActionInk(
              buttonString: widget.mainButtonString,
              width: 0.42,
            ),
          )
        ],
      ),
    );
  }
}
