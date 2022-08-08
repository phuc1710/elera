import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    Key? key,
    this.title,
    this.color,
    this.borderColor,
    this.style,
    this.borderRadius,
    this.titleColor,
    this.onTap,
    this.shadow,
  }) : super(key: key);

  final String? title;
  final Color? color;
  final Color? titleColor;
  final Color? borderColor;
  final TextStyle? style;
  final double? borderRadius;
  final Function()? onTap;
  final List<BoxShadow>? shadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 50,
      constraints: const BoxConstraints(maxWidth: 200, minWidth: 100),
      decoration: BoxDecoration(
        color: color,
        border:
            Border.all(color: borderColor ?? color ?? const Color(0xFF000000)),
        borderRadius: BorderRadius.circular(borderRadius ?? 30),
        boxShadow: shadow,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(borderRadius ?? 30),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius ?? 30),
          onTap: onTap,
          child: Center(
            child: Text(
              title ?? '',
              style: style ??
                  Theme.of(context).textTheme.button?.copyWith(
                        color:
                            titleColor ?? Theme.of(context).colorScheme.primary,
                      ),
            ),
          ),
        ),
      ),
    );
  }
}
