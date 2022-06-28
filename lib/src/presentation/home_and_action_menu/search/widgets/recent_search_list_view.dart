import 'package:flutter/material.dart';

import '../../../../models/recent_search/recent_search_model.dart';
import '../../home/widgets/title_row.dart';

class RecentSearchListView extends StatefulWidget {
  const RecentSearchListView({
    Key? key,
    required this.onSuggestPressed,
  }) : super(key: key);

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
          itemCount: recentSearchList.length,
          itemBuilder: (context, i) => ListTile(
            contentPadding: EdgeInsets.zero,
            dense: true,
            minLeadingWidth: 0,
            onTap: () {
              setState(() {
                searchPhrase = recentSearchList[i];
              });
              widget.onSuggestPressed();
            },
            title: Text(
              recentSearchList[i],
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: Colors.grey,
                  ),
            ),
            trailing: InkWell(
              onTap: () => setState(() {
                recentSearchList.removeAt(i);
              }),
              child: const Icon(Icons.cancel_outlined),
            ),
          ),
        ),
      ],
    );
  }

  String getSearchPhrase() {
    return searchPhrase;
  }
}
