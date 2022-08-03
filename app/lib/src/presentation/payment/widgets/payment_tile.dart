import 'package:flutter/material.dart';

import '../../../data/models/payment/payment_response_model.dart';

class PaymentTile extends StatelessWidget {
  const PaymentTile({Key? key, required this.data}) : super(key: key);

  final PaymentModel? data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      leading: Image.network(data?.img ?? '', width: 40, height: 40),
      title: Text(
        data?.displayName ?? '',
        style: Theme.of(context)
            .textTheme
            .bodyText2
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
      trailing: Text(
        data?.status ?? '',
        style: Theme.of(context).textTheme.bodyText2?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
    );
  }
}
