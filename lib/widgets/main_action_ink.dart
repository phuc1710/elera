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
          borderRadius: BorderRadius.circular(40)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * (_width ?? 0.8),
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
    if (_isMainAction == null) {
      return Theme.of(context).primaryColor;
    } else {
      return Theme.of(context).colorScheme.secondary;
    }
  }

  TextStyle? getButtonTextStyle(BuildContext context) {
    if (_isMainAction == null) {
      return Theme.of(context).textTheme.labelSmall;
    } else {
      return Theme.of(context).textTheme.labelMedium;
    }
  }

  List<BoxShadow>? getButtonBoxShadow(BuildContext context) {
    if (_isMainAction == null) {
      return [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 10,
          offset: const Offset(0, 3),
        )
      ];
    } else {
      return null;
    }
  }
}
