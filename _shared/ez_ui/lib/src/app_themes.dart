// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project imports:
import './app_colors.dart';
import './typography/app_text_styles.dart';
import './typography/app_size.dart';
import 'widgets/tab_indicator.dart';

const _smallTextScaleFactor = 0.80;
const _largeTextScaleFactor = 1.20;
const double defaultFontSize = 16;

class AppTheme {
  static final ThemeData light = _lightTheme();

  static final ThemeData dark = _darkTheme();

  static ThemeData base = ThemeData();

  static ThemeData _darkTheme() {
    base = ThemeData.dark();

    return base.copyWith(
      useMaterial3: true,
      backgroundColor: Colors.grey[900],
      scaffoldBackgroundColor: Colors.grey[800],
      brightness: Brightness.dark,
      primaryColor: AppColors.primary,
      dividerColor: Colors.grey[900],
      primaryTextTheme:
          TextTheme(headline1: AppTextStyles.withColor(AppColors.onPrimary)),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
        },
      ),
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        color: Colors.grey[900],
        titleTextStyle: AppTextStyles.withColor(AppColors.onPrimary),
      ),
      textTheme: TextTheme(
        subtitle1: AppTextStyles.withColor(AppColors.onPrimary),
        headline1: AppTextStyles.withColor(AppColors.black),
        headline2: AppTextStyles.withColor(AppColors.primary),
        bodyText2: AppTextStyles.withColor(AppColors.black),
        headline3: AppTextStyles.withColor(AppColors.surface),
      ),
      tabBarTheme: TabBarTheme(
        indicator: const BubbleTabIndicator(
          indicatorHeight: 36,
          indicatorRadius: 10,
          indicatorColor: AppColors.surface,
          tabBarIndicatorSize: TabBarIndicatorSize.tab,
          insets: EdgeInsets.only(top: 40),
        ),
        unselectedLabelStyle: AppTextStyles.styleWeight400Normal(
          AppColors.black,
          fontSize: FontSize.s13,
        ),
        labelStyle: AppTextStyles.styleWeight500Normal(
          AppColors.primary,
          fontSize: FontSize.s13,
        ),
        unselectedLabelColor: AppColors.secondary,
        labelColor: AppColors.surface,
        indicatorSize: TabBarIndicatorSize.label,
      ),
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: AppColors.secondary),
    );
  }

  static ThemeData _lightTheme() {
    base = ThemeData.light();

    return base.copyWith(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.surface,
      backgroundColor: AppColors.background,
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      dividerColor: AppColors.surface,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
        },
      ),
      appBarTheme: AppBarTheme(
        color: AppColors.onPrimary,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        titleTextStyle: AppTextStyles.withColor(AppColors.black),
        surfaceTintColor: AppColors.background,
      ),
      textTheme: TextTheme(
        subtitle1: AppTextStyles.withColor(AppColors.black),
        headline1: AppTextStyles.withColor(AppColors.black),
        headline2: AppTextStyles.withColor(AppColors.primary),
        headline3: AppTextStyles.withColor(AppColors.primary),
        bodyText2: AppTextStyles.withColor(AppColors.black),
      ),
      tabBarTheme: TabBarTheme(
        unselectedLabelStyle: AppTextStyles.styleWeight400Normal(
          AppColors.black,
          fontSize: FontSize.s13,
        ),
        labelStyle: AppTextStyles.styleWeight500Normal(
          AppColors.primary,
          fontSize: FontSize.s13,
        ),
        unselectedLabelColor: AppColors.black,
        labelColor: AppColors.primary,
        indicatorSize: TabBarIndicatorSize.label,
      ),
      cardTheme: const CardTheme(surfaceTintColor: AppColors.background),
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: AppColors.secondary),
    );
  }

  /// `ThemeData` for EZ UI for small screens.
  static ThemeData get small {
    return base.copyWith(textTheme: _smallTextTheme);
  }

  /// `ThemeData` for EZ UI for medium screens.
  static ThemeData get medium {
    return base.copyWith(textTheme: _smallTextTheme);
  }

  /// `ThemeData` for EZ UI for large screens.
  static ThemeData get large {
    return base.copyWith(textTheme: _largeTextTheme);
  }

  static TextTheme get _smallTextTheme {
    return TextTheme(
      subtitle1: AppTextStyles.withColor(AppColors.black).copyWith(
        fontSize: defaultFontSize * _smallTextScaleFactor,
      ),
      headline1: AppTextStyles.withColor(
        AppColors.black,
      ).copyWith(
        fontSize: defaultFontSize * _smallTextScaleFactor,
      ),
      headline2: AppTextStyles.withColor(AppColors.primary).copyWith(
        fontSize: defaultFontSize * _smallTextScaleFactor,
      ),
      headline3: AppTextStyles.withColor(AppColors.primary).copyWith(
        fontSize: defaultFontSize * _smallTextScaleFactor,
      ),
      bodyText2: AppTextStyles.withColor(AppColors.black).copyWith(
        fontSize: defaultFontSize * _smallTextScaleFactor,
      ),
    );
  }

  static TextTheme get _largeTextTheme {
    return TextTheme(
      subtitle1: AppTextStyles.withColor(AppColors.black).copyWith(
        fontSize: defaultFontSize * _largeTextScaleFactor,
      ),
      headline1: AppTextStyles.withColor(AppColors.black).copyWith(
        fontSize: defaultFontSize * _largeTextScaleFactor,
      ),
      headline2: AppTextStyles.withColor(AppColors.primary).copyWith(
        fontSize: defaultFontSize * _largeTextScaleFactor,
      ),
      headline3: AppTextStyles.withColor(AppColors.primary).copyWith(
        fontSize: defaultFontSize * _largeTextScaleFactor,
      ),
      bodyText2: AppTextStyles.withColor(AppColors.black).copyWith(
        fontSize: defaultFontSize * _largeTextScaleFactor,
      ),
    );
  }
}
