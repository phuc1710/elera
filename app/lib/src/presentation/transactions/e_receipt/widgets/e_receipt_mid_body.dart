import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/e_receipt/e_receipt_response.dart';
import 'component_text.dart';
import 'conponent_value.dart';

class EReceiptMidBody extends StatelessWidget {
  const EReceiptMidBody({
    Key? key,
    required this.text,
    this.value,
  }) : super(key: key);

  final String text;
  final EReceiptModel? value;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final l10n = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
        child: Padding(
          padding:
              const EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ComponentText(text: l10n.name),
                  ComponentText(text: l10n.phone),
                  ComponentText(text: l10n.email),
                  ComponentText(text: l10n.country),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ComponentValue(value: value?.name ?? ''),
                  ComponentValue(value: value?.phone ?? ''),
                  ComponentValue(value: value?.email ?? ''),
                  ComponentValue(value: value?.country ?? ''),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
