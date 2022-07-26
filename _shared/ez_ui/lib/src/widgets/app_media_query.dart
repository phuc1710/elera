// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../app_colors.dart';

class AppMediaQuery extends StatelessWidget {
  const AppMediaQuery({
    Key? key,
    required this.child,
    required this.text,
    this.showBanner = false,
  }) : super(key: key);
  final Widget? child;
  final bool showBanner;
  final String text;
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[child ?? const SizedBox(), _buildBanner()],
      ),
    );
  }

  Widget _buildBanner() {
    if (showBanner) {
      return Banner(
        message: text,
        color: AppColors.error,
        location: BannerLocation.topEnd,
      );
    }

    return const SizedBox();
  }
}
