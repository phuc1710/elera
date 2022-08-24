import 'package:flutter/material.dart';

class StarChip extends StatelessWidget {
  const StarChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: primaryColor,
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 4.0,
          horizontal: 10.0,
        ),
        child: Row(
          children: [
            Icon(
              Icons.star_rounded,
              color: primaryColor,
              size: 20,
            ),
            const SizedBox.square(dimension: 5),
            Text(
              '5',
              style: textTheme.caption?.copyWith(
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
