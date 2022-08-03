import 'package:flutter/material.dart';

class MainActionInk extends StatelessWidget {
  const MainActionInk({
    Key? key,
    required String buttonString,
    bool? isMainAction,
    double? width,
  })  : _buttonString = buttonString,
        _isMainAction = isMainAction,
        _width = width,
        super(key: key);

  final String _buttonString;
  final bool? _isMainAction;
  final double? _width;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: getButtonColor(context),
        boxShadow: getButtonBoxShadow(context),
        borderRadius: BorderRadius.circular(40),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * (_width ?? 0.9),
        height: MediaQuery.of(context).size.height * 0.08,
        child: Center(
          child: Text(
            _buttonString,
            style: getButtonTextStyle(context),
          ),
        ),
      ),
    );
  }

  Color getButtonColor(BuildContext context) {
    return _isMainAction == null
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.secondary;
  }

  TextStyle? getButtonTextStyle(BuildContext context) {
    return _isMainAction == null
        ? Theme.of(context)
            .textTheme
            .bodyText2
            ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)
        : Theme.of(context).textTheme.bodyText2?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            );
  }

  List<BoxShadow>? getButtonBoxShadow(BuildContext context) {
    return _isMainAction == null
        ? [
            const BoxShadow(
              color: Color.fromRGBO(51, 94, 247, 0.25),
              blurRadius: 24,
              offset: Offset(4, 8),
            )
          ]
        : null;
  }
}
