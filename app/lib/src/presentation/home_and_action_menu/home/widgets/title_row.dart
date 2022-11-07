import 'package:flutter/material.dart';

import 'section_text.dart';

class TitleRow extends StatelessWidget {
  const TitleRow({
    Key? key,
    required this.title,
    required this.leadingButtonText,
    required this.leadingButtonCallback,
  }) : super(key: key);

  final String title;
  final String leadingButtonText;
  final VoidCallback leadingButtonCallback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.005,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SectionText(text: title),
          InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: leadingButtonCallback,
            child: Text(
              leadingButtonText,
              style: Theme.of(context).textTheme.button?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
