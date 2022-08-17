import 'package:flutter/material.dart';

import '../widgets/appbar_widget.dart';
import '../widgets/component_text.dart';
import '../widgets/conponent_value.dart';

class EReceiptView extends StatelessWidget {
  const EReceiptView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String title = 'E-Receipt';
    final screenHeight = MediaQuery.of(context).size.height;
    final style1 = TextStyle(
      fontSize: 14,
      color: Colors.grey[600],
    );
    const String text = 'Course';
    final primaryColor = Theme.of(context).colorScheme.primary;
    const String value = 'Materring Figma A to Z';

    return Scaffold(
      body: Column(
        children: [
          const AppBarWidget(
            title: title,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    // bottom: 10,
                  ),
                  child: Image.asset('assets/images/img_barcode.png'),
                ),
              ),
            ],
          ),
          Padding(
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
                        ComponentText(text: text, style1: style1),
                        ComponentText(text: 'Category', style1: style1),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        ComponentValue(value: value),
                        ComponentValue(value: 'UI/UX Desin'),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
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
                        ComponentText(text: text, style1: style1),
                        ComponentText(text: 'Name', style1: style1),
                        ComponentText(text: 'Email', style1: style1),
                        ComponentText(text: 'Country', style1: style1),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        ComponentValue(value: 'Materring Figma A to Z'),
                        ComponentValue(value: '+123456789'),
                        ComponentValue(value: 'andrw_ainsley@domain.com'),
                        ComponentValue(value: 'United States'),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
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
                        ComponentText(text: 'Price', style1: style1),
                        ComponentText(text: 'Payment Methots', style1: style1),
                        ComponentText(text: 'Transaction ID', style1: style1),
                        ComponentText(text: 'Date', style1: style1),
                        ComponentText(text: 'Status', style1: style1),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const ComponentValue(value: r'$40'),
                        const ComponentValue(value: 'UI/UX Desin'),
                        const ComponentValue(value: '123456789'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const ComponentValue(value: '123456789'),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.copy,
                                  size: 20,
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: 40.0,
                            height: 20.0,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorLight,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Paid',
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

//   Padding componentTextValue(String text) => Padding(
//         padding: const EdgeInsets.only(bottom: 10.0),
//         child: Text(text),
//       );

//   Padding componentText(String text, TextStyle style1) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 10.0),
//       child: Text(
//         text,
//         style: style1,
//       ),
//     );
//   }
}
