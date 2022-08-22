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
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: Theme.of(context).colorScheme.primary),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            originalPrice,
            style: Theme.of(context).textTheme.button?.copyWith(
                  decoration: TextDecoration.lineThrough,
                  color: const Color(0xff616161),
                ),
          ),
        )
      ],
    );
  }
}
