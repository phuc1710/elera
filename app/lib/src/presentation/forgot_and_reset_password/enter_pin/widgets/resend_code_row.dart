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
    final TextStyle? bodyText2 = Theme.of(context).textTheme.bodyText2;

    return Expanded(
      flex: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Resend code in ', style: bodyText2),
          buildResendTimerAndButton(context),
          Text(' s', style: bodyText2),
        ],
      ),
    );
  }

  Widget buildResendTimerAndButton(BuildContext context) {
    const Duration duration = Duration(minutes: 1);
    final TextStyle? bodyText2withColor = Theme.of(context)
        .textTheme
        .bodyText2
        ?.copyWith(color: Theme.of(context).colorScheme.primary);

    return !isTimeOut
        ? TweenAnimationBuilder(
            tween: Tween(begin: duration, end: Duration.zero),
            duration: duration,
            builder: (BuildContext context, Duration duration, Widget? child) =>
                Text('${duration.inSeconds}', style: bodyText2withColor),
            onEnd: () => setState(() => isTimeOut = true),
          )
        : InkWell(
            onTap: () {
              context
                  .read<PinEntryBloc>()
                  .add(PinSendingRequested(widget.contactInfo));
              setState(() => isTimeOut = false);
            },
            child: Text('Resend', style: bodyText2withColor),
          );
  }
}
