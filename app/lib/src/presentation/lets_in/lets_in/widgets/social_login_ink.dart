import 'package:flutter/material.dart';

class SocialLoginInk extends StatelessWidget {
  const SocialLoginInk({
    required this.iconPath,
    required this.text,
    Key? key,
  }) : super(key: key);

  final String iconPath;
  final String text;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Ink(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      width: screenWidth * 0.9,
      height: screenHeight * 0.075,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: screenWidth * 0.06,
              height: screenHeight * 0.06,
              child: Image.asset(iconPath),
            ),
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.caption?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
