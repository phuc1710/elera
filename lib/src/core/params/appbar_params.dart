// Flutter imports:
import 'package:flutter/material.dart';

class AppBarParams {
  AppBarParams(
    this.context, {
    this.title,
    this.titleWidget,
    this.onExit,
    this.hasBack = true,
    this.elevation = 0,
    this.actions,
    this.backButton,
    this.centerTitle = false,
    this.bottom,
    this.titleColor,
    this.backgroundColor,
    this.screenName,
  });

  final BuildContext context;
  final String? title;
  final Widget? titleWidget;
  final VoidCallback? onExit;
  final bool hasBack;
  final double elevation;
  final List<Widget>? actions;
  final Widget? backButton;
  final bool centerTitle;
  final PreferredSizeWidget? bottom;
  final Color? titleColor;
  final Color? backgroundColor;
  final String? screenName;
}
