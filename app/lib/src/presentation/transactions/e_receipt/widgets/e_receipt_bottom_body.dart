import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../data/models/e_receipt/e_receipt_response.dart';
import 'component_text.dart';
import 'conponent_value.dart';

class EReceiptBottomBody extends StatelessWidget {
  const EReceiptBottomBody({
    Key? key,
    this.value,
  }) : super(key: key);
  final EReceiptModel? value;
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

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
                children: const [
                  ComponentText(text: 'Price'),
                  ComponentText(text: 'Payment Methots'),
                  ComponentText(text: 'Date'),
                  ComponentText(text: 'Transaction ID'),
                  ComponentText(text: 'Status'),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ComponentValue(value: value?.price ?? ''),
                  ComponentValue(value: value?.paymentMethod ?? ''),
                  ComponentValue(value: value?.date ?? ''),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ComponentValue(value: value?.transactionId ?? ''),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: () {
                            Clipboard.setData(
                              ClipboardData(
                                text: value?.transactionId ?? '',
                              ),
                            ).then((_) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Copied to your clipboard !',
                                  ),
                                ),
                              );
                            });
                          },
                          color: primaryColor,
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
                        value?.status ?? '',
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
    );
  }
}
