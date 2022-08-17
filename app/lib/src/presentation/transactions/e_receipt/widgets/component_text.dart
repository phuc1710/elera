import 'package:flutter/material.dart';

class ComponentText extends StatelessWidget {
  const ComponentText({
    Key? key,
    required this.text,
    required this.style1,
  }) : super(key: key);

  final String text;
  final TextStyle style1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        text,
        style: style1,
      ),
    );
  }
}
