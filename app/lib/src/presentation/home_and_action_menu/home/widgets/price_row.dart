import 'package:flutter/material.dart';

class PriceRow extends StatelessWidget {
  const PriceRow({
    Key? key,
    required this.price,
    required this.originalPrice,
  }) : super(key: key);

  final String price;
  final String originalPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(
            right: MediaQuery.of(context).size.width * 0.01,
          ),
          child: Text(
            price,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        Text(
          originalPrice,
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                decoration: TextDecoration.lineThrough,
              ),
        ),
      ],
    );
  }
}
