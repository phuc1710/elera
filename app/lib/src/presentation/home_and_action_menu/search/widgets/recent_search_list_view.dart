import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

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
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: Column(
        children: [
          TitleRow(
            title: AppLocalizations.of(context).recent,
            leadingButtonText: AppLocalizations.of(context).clearAll,
            leadingButtonCallback: () => setState(() {
              widget.searchList?.clear();
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
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
              ),
              trailing: InkWell(
                onTap: () => setState(() {
                  widget.searchList?.removeAt(i);
                }),
                child: const Icon(IconlyLight.close_square),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
