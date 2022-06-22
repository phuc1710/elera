import 'package:flutter/material.dart';

class BookmarkButton extends StatefulWidget {
  const BookmarkButton({
    Key? key,
  }) : super(key: key);

  @override
  State<BookmarkButton> createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  bool _isBookmarked = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _isBookmarked = !_isBookmarked;
              });
            },
            child: Icon(
              _isBookmarked ? Icons.bookmark : Icons.bookmark_outline,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
