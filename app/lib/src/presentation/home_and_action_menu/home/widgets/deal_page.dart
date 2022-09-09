import 'package:flutter/material.dart';

class DealPage extends StatelessWidget {
  const DealPage({Key? key, this.image}) : super(key: key);

  final String? image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Image.network('$image', fit: BoxFit.cover),
    );
  }
}
