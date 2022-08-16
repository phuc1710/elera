import 'package:flutter/material.dart';

import 'dialog_content.dart';
import 'dialog_title.dart';

class RatingDialog extends StatelessWidget {
  const RatingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      title: const DialogTitle(),
      content: const DialogContent(),
    );
  }
}
