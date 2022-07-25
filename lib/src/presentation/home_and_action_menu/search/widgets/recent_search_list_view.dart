import 'package:flutter/material.dart';

import '../../../../core/utils/constants.dart';
import '../../home/widgets/title_row.dart';

class RecentSearchListView extends StatefulWidget {
  const RecentSearchListView({
    Key? key,
    this.searchList,
    required this.onSuggestPressed,
  }) : super(key: key);

  final List<String>? searchList;
  final VoidCallback onSuggestPressed;
  @override
  State<RecentSearchListView> createState() => RecentSearchListViewState();
}

class RecentSearchListViewState extends State<RecentSearchListView> {
  String searchPhrase = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleRow(
          title: 'Recent',
          leadingButtonText: 'Clear All',
          leadingButtonCallback: () => setState(() {
            widget.searchList?.clear();
            recentSearchList.clear();
          }),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.01,
          ),
          child: const Divider(),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: widget.searchList?.length,
          itemBuilder: (context, i) => ListTile(
            contentPadding: EdgeInsets.zero,
            dense: true,
            minLeadingWidth: 0,
            onTap: () {
              setState(() {
                searchPhrase = widget.searchList?[i] ?? '';
              });
              widget.onSuggestPressed();
            },
            title: Text(
              '${widget.searchList?[i]}',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: Colors.grey,
                  ),
            ),
            trailing: InkWell(
              onTap: () => setState(() {
                widget.searchList?.removeAt(i);
              }),
              child: const Icon(Icons.cancel_outlined),
            ),
          ),
        ),
      ],
    );
  }
}
