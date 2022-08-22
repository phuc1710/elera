import 'package:flutter/material.dart';

class ComponentValue extends StatelessWidget {
  const ComponentValue({
    Key? key,
    required this.value,
  }) : super(key: key);

  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(value),
    );
  }
}
