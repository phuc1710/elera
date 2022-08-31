import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import 'reviewer_list_tile.dart';

class ReviewListTile extends StatelessWidget {
  const ReviewListTile({
    Key? key,
    this.fullName,
    this.avatar,
    this.rating,
    this.content,
    this.likeCount,
  }) : super(key: key);

  final String? fullName;
  final String? avatar;
  final String? content;
  final int? likeCount;
  final int? rating;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        children: [
          ReviewerListTile(fullName: fullName, avatar: avatar, rating: rating),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              '$content',
              style: textTheme.overline
                  ?.copyWith(fontSize: 12, color: const Color(0xff616161)),
            ),
          ),
          Row(
            children: <Widget>[
              IconButton(
                visualDensity: VisualDensity.compact,
                padding: EdgeInsets.zero,
                splashRadius: 20,
                onPressed: () {},
                icon: const Icon(IconlyBold.heart, color: Color(0xffff5971)),
                iconSize: 30,
              ),
              Text('$likeCount', style: textTheme.caption),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  '2 week ago',
                  style: textTheme.overline?.copyWith(color: Colors.grey[600]),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
