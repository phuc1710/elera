import 'package:flutter/material.dart';

import '../../../../data/models/e_receipt/e_receipt_response.dart';
import 'component_text.dart';
import 'conponent_value.dart';

class EReceiptTopBody extends StatelessWidget {
  const EReceiptTopBody({
    Key? key,
    required this.text,
    required this.value,
  }) : super(key: key);

  final String text;

  final EReceiptModel? value;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
        child: Padding(
          padding: const EdgeInsets.only(
            right: 20,
            left: 20,
            top: 20,
            bottom: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ComponentText(
                    text: text,
                  ),
                  const ComponentText(
                    text: 'Category',
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ComponentValue(value: value?.courseName ?? ''),
                  ComponentValue(value: value?.courseCategory ?? ''),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
