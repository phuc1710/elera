import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/main_action_ink.dart';
import '../bloc/pin_entry_bloc.dart';

class MainActionButton extends StatefulWidget {
  const MainActionButton({Key? key, required this.pin}) : super(key: key);

  final String pin;
  @override
  State<MainActionButton> createState() => _MainActionButtonState();
}

class _MainActionButtonState extends State<MainActionButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.042),
      child: InkWell(
        borderRadius: BorderRadius.circular(40),
        onTap: () => onContinueButtonTapped(context),
        child: const MainActionInk(buttonString: 'Verify', width: 0.9,),
      ),
    );
  }

  void onContinueButtonTapped(BuildContext context) {
    context.read<PinEntryBloc>().add(PinEntrySubmitted(widget.pin));
  }
}
