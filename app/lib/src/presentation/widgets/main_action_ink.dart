import 'package:flutter/material.dart';

class MainActionInk extends StatelessWidget {
  const MainActionInk({
    Key? key,
    required this.buttonString,
    this.isMainAction,
    this.disableShadow,
    this.width,
  }) : super(key: key);

  final String buttonString;
  final bool? isMainAction;
  final bool? disableShadow;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: getButtonColor(context),
        boxShadow: getButtonBoxShadow(context),
        borderRadius: BorderRadius.circular(40),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * (width ?? 0.9),
        height: MediaQuery.of(context).size.height * 0.08,
        child: Center(
          child: Text(
            buttonString,
            style: getButtonTextStyle(context),
          ),
        ),
      ),
    );
  }

  Color getButtonColor(BuildContext context) {
    final ColorScheme color = Theme.of(context).colorScheme;

    if (isMainAction ?? true) {
      return color.primary;
    }

    return color.secondary;
  }

  TextStyle? getButtonTextStyle(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyText2;

    if (isMainAction == null) {
      return textStyle?.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      );
    }

    return textStyle?.copyWith(
      color: Theme.of(context).colorScheme.primary,
      fontWeight: FontWeight.bold,
    );
  }

  List<BoxShadow>? getButtonBoxShadow(BuildContext context) {
    if (isMainAction == null) {
      if (disableShadow == null) {
        return [
          const BoxShadow(
            color: Color.fromRGBO(51, 94, 247, 0.25),
            blurRadius: 24,
            offset: Offset(4, 8),
          )
        ];
      }

      return null;
    } else {
      return null;
    }
  }
}
