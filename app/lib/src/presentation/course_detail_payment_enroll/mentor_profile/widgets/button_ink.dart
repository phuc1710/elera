import 'package:flutter/material.dart';

class ButtonInk extends StatelessWidget {
  const ButtonInk({
    Key? key,
    required this.decoration,
    required this.icon,
    required this.text,
    required this.contentColor,
  }) : super(key: key);

  final BoxDecoration decoration;
  final IconData icon;
  final String text;
  final Color contentColor;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return Ink(
      decoration: decoration,
      child: SizedBox(
        width: screenWidth * 0.4,
        height: screenHeight * 0.05,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(icon, color: contentColor, size: 16),
              ),
              Text(
                text,
                style: textTheme.button?.copyWith(color: contentColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
