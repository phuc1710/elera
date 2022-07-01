import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    Key? key,
    this.title,
    this.color,
    this.style,
    this.borderRadius,
    this.titleColor,
    this.onTap,
  }) : super(key: key);

  final String? title;
  final Color? color;
  final Color? titleColor;
  final TextStyle? style;
  final double? borderRadius;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 50,
      constraints: const BoxConstraints(maxWidth: 200, minWidth: 100),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius ?? 30),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Text(
              title ?? '',
              style: style ??
                  Theme.of(context)
                      .textTheme
                      .displayLarge
                      ?.copyWith(color: titleColor ?? Colors.blue),
            ),
          ),
        ),
      ),
    );
  }
}
