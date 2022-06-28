import 'package:flutter/material.dart';

import 'rich_result_text.dart';

class SearchResultTitleRow extends StatefulWidget {
  const SearchResultTitleRow({
    Key? key,
    required this.phrase,
    required this.leadingText,
  }) : super(key: key);

  final String phrase;
  final String leadingText;

  @override
  State<SearchResultTitleRow> createState() => _SearchResultTitleRowState();
}

class _SearchResultTitleRowState extends State<SearchResultTitleRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.015,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichResultText(text: widget.phrase ),
          Text(
            widget.leadingText,
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
