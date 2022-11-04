import 'package:flutter/material.dart';

class CourseImage extends StatelessWidget {
  const CourseImage({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.04),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox.square(
          dimension: 120,
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
