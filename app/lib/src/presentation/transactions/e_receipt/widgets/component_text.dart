import 'package:flutter/material.dart';

class ComponentText extends StatelessWidget {
  const ComponentText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    final style1 = TextStyle(
      fontSize: 14,
      color: Colors.grey[600],
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        text,
        style: style1,
      ),
    );
  }
}
