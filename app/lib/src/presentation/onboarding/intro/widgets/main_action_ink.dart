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

    return isMainAction == null ? color.primary : color.secondary;
  }

  TextStyle? getButtonTextStyle(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyText2;

    return isMainAction == null
        ? textStyle?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)
        : textStyle?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          );
  }

  List<BoxShadow>? getButtonBoxShadow(BuildContext context) {
    return isMainAction == null
        ? disableShadow == null
            ? [
                const BoxShadow(
                  color: Color.fromRGBO(51, 94, 247, 0.25),
                  blurRadius: 24,
                  offset: Offset(4, 8),
                )
              ]
            : null
        : null;
  }
}
