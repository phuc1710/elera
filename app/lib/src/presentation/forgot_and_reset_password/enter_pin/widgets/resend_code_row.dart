import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/pin_entry_bloc.dart';

class ResendCodeRow extends StatefulWidget {
  const ResendCodeRow({
    Key? key,
    required this.contactInfo,
  }) : super(key: key);

  final String contactInfo;

  @override
  State<ResendCodeRow> createState() => _ResendCodeRowState();
}

class _ResendCodeRowState extends State<ResendCodeRow> {
  bool isTimeOut = false;
  @override
  Widget build(BuildContext context) {
    final TextStyle? displayMedium = Theme.of(context).textTheme.displayMedium;

    return Expanded(
      flex: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Resend code in ', style: displayMedium),
          buildResendTimerAndButton(context),
          Text(' s', style: displayMedium),
        ],
      ),
    );
  }

  Widget buildResendTimerAndButton(BuildContext context) {
    const Duration duration = Duration(minutes: 1);

    return !isTimeOut
        ? TweenAnimationBuilder(
            tween: Tween(begin: duration, end: Duration.zero),
            duration: duration,
            builder: (BuildContext context, Duration duration, Widget? child) {
              return Text(
                '${duration.inSeconds}',
                style: Theme.of(context).textTheme.labelMedium,
              );
            },
            onEnd: () => setState(() => isTimeOut = true),
          )
        : InkWell(
            onTap: () {
              context
                  .read<PinEntryBloc>()
                  .add(PinSendingRequested(widget.contactInfo));
              setState(() => isTimeOut = false);
            },
            child:
                Text('Resend', style: Theme.of(context).textTheme.labelMedium),
          );
  }
}
