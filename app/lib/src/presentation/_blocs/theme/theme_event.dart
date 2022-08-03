part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent {}

class DarkThemeEnabled extends ThemeEvent{}

class DarkThemeDisabled extends ThemeEvent{}
