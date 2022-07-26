// Flutter imports:
import 'package:flutter/material.dart';

/// Used with [TabBar.indicator] to draw a bubble on the
/// selected tab.
///
/// The [indicatorHeight] defines the bubble height.
/// The [indicatorColor] defines the bubble color.
/// The [indicatorRadius] defines the bubble corner radius.
/// The [tabBarIndicatorSize] specifies the type of TabBarIndicatorSize i.e label or tab.
/// /// The selected tab bubble is inset from the tab's boundary by [insets] when [tabBarIndicatorSize] is tab.
/// The selected tab bubble is applied padding by [padding] when [tabBarIndicatorSize] is label.

class BubbleTabIndicator extends Decoration {
  const BubbleTabIndicator({
    this.indicatorHeight = 20.0,
    this.indicatorColor = Colors.greenAccent,
    this.indicatorRadius = 100.0,
    this.tabBarIndicatorSize = TabBarIndicatorSize.label,
    this.padding = const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
    this.insets = const EdgeInsets.symmetric(horizontal: 5.0),
  });

  final double indicatorHeight;

  final Color indicatorColor;
  final double indicatorRadius;
  @override
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry insets;
  final TabBarIndicatorSize tabBarIndicatorSize;

  @override
  BubblePainter createBoxPainter([VoidCallback? onChanged]) {
    return BubblePainter(this, onChanged);
  }

  @override
  Decoration? lerpFrom(Decoration? a, double t) {
    if (a is BubbleTabIndicator) {
      return BubbleTabIndicator(
        padding: EdgeInsetsGeometry.lerp(a.padding, padding, t) ??
            const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
        insets: EdgeInsetsGeometry.lerp(a.insets, insets, t) ??
            const EdgeInsets.symmetric(horizontal: 5.0),
      );
    }

    return super.lerpFrom(a, t);
  }

  @override
  Decoration? lerpTo(Decoration? b, double t) {
    if (b is BubbleTabIndicator) {
      return BubbleTabIndicator(
        padding: EdgeInsetsGeometry.lerp(padding, b.padding, t) ??
            const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
        insets: EdgeInsetsGeometry.lerp(insets, b.insets, t) ??
            const EdgeInsets.symmetric(horizontal: 5.0),
      );
    }

    return super.lerpTo(b, t);
  }
}

class BubblePainter extends BoxPainter {
  BubblePainter(this.decoration, VoidCallback? onChanged) : super(onChanged);

  final BubbleTabIndicator decoration;

  Color get indicatorColor => decoration.indicatorColor;
  double get indicatorHeight => decoration.indicatorHeight;
  double get indicatorRadius => decoration.indicatorRadius;
  EdgeInsetsGeometry get insets => decoration.insets;
  EdgeInsetsGeometry get padding => decoration.padding;
  TabBarIndicatorSize get tabBarIndicatorSize => decoration.tabBarIndicatorSize;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);
    final rect = Offset(
          offset.dx,
          ((configuration.size?.height ?? 0) / 2) - indicatorHeight / 2,
        ) &
        Size(configuration.size?.width ?? 0, indicatorHeight);
    final textDirection = configuration.textDirection;
    final indicator = _indicatorRectFor(rect, textDirection);
    final paint = Paint();
    paint.color = indicatorColor;
    paint.style = PaintingStyle.fill;
    canvas.drawRRect(
      RRect.fromRectAndRadius(indicator, Radius.circular(indicatorRadius)),
      paint,
    );
  }

  Rect _indicatorRectFor(Rect rect, TextDirection? textDirection) {
    var indicator = padding.resolve(textDirection).inflateRect(rect);

    if (tabBarIndicatorSize == TabBarIndicatorSize.tab) {
      indicator = insets.resolve(textDirection).deflateRect(rect);
    }

    return Rect.fromLTWH(
      indicator.left,
      indicator.top,
      indicator.width,
      indicator.height,
    );
  }
}
