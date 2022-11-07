import 'package:flutter/material.dart';

class BarcodeWidget extends StatelessWidget {
  const BarcodeWidget({
    Key? key, required this.img,
  }) : super(key: key);
final String img;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
              // bottom: 10
            ),
            child: Image.asset(img),
          ),
        ),
      ],
    );
  }
}
