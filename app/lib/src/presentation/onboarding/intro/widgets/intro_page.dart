import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({
    Key? key,
    required this.imagePath,
    required this.text,
  }) : super(key: key);

  final String imagePath;
  final String text;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        SizedBox(
          height: screenHeight * 0.5,
          child: Image.asset(imagePath),
        ),
        SizedBox(
          width: screenWidth * 0.9,
          height: screenHeight * 0.3,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ],
    );
  }
}
