import 'package:flutter/material.dart';

class ResendCodeRow extends StatelessWidget {
  const ResendCodeRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Resend code in ',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          TweenAnimationBuilder(
            tween: Tween(begin: const Duration(minutes: 1), end: Duration.zero),
            duration: const Duration(minutes: 1),
            builder: (BuildContext context, Duration duration, Widget? child) {
              return Text(
                '${duration.inSeconds}',
                style: Theme.of(context).textTheme.labelMedium,
              );
            },
          ),
          Text(
            ' s',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ],
      ),
    );
  }
}
