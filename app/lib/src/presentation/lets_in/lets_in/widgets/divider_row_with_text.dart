import 'package:flutter/material.dart';

class DividerRowWithText extends StatelessWidget {
  const DividerRowWithText({
    Key? key,
    required String text,
    required EdgeInsets padding,
  })  : _text = text,
        _padding = padding,
        super(key: key);

  final String _text;
  final EdgeInsets _padding;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: _padding,
      child: Row(
        children: [
          Expanded(child: Divider(endIndent: screenWidth * 0.03)),
          FittedBox(
            child: Center(
              child: Text(
                _text,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: const Color(0xff616161),
                    ),
              ),
            ),
          ),
          Expanded(child: Divider(indent: screenWidth * 0.03))
        ],
      ),
    );
  }
}
