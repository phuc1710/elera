import 'package:flutter/material.dart';

class TransactionsCourseImage extends StatelessWidget {
  const TransactionsCourseImage({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: MediaQuery.of(context).size.width * 0.03,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: SizedBox.square(
          dimension: 80,
          child: Image.network(imagePath, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
