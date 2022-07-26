// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'app_size.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle withColor(Color? color) {
    return TextStyle(color: color);
  }

  static TextStyle withFontSize(double fontSize) {
    return TextStyle(fontSize: fontSize);
  }

  static TextStyle withColorHeight(Color? color, double height) {
    return TextStyle(color: color, height: height);
  }

  static TextStyle withHeight(double height) {
    return TextStyle(height: height);
  }

  static TextStyle withColorFontWeight(Color? color, FontWeight fontWeight) {
    return TextStyle(color: color, fontWeight: fontWeight);
  }

  static TextStyle withColorSize(Color? color, double fontSize) {
    return TextStyle(color: color, fontSize: fontSize);
  }

  static TextStyle styleWeight400Normal(
    Color? color, {
    double fontSize = FontSize.s14,
    double? letterSpacing,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: fontSize,
        letterSpacing: letterSpacing,
        decoration: decoration,
      );

  static TextStyle styleWeight500Normal(
    Color? color, {
    double fontSize = FontSize.s14,
    double? letterSpacing,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        fontSize: fontSize,
        letterSpacing: letterSpacing,
        decoration: decoration,
      );

  static TextStyle styleWeight600Normal(
    Color? color, {
    double fontSize = FontSize.s14,
    double? letterSpacing,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontSize: fontSize,
        letterSpacing: letterSpacing,
        decoration: decoration,
      );

  static TextStyle styleWeight700Normal(
    Color? color, {
    double fontSize = FontSize.s14,
    double? letterSpacing,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        fontSize: fontSize,
        letterSpacing: letterSpacing,
        decoration: decoration,
      );
}
