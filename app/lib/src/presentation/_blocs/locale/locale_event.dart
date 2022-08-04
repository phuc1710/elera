part of 'locale_bloc.dart';

@immutable
abstract class LocaleEvent {}

class LocaleCached extends LocaleEvent {
  LocaleCached();
}

class LocaleChanged extends LocaleEvent {
  LocaleChanged(this.locale);

  final String locale;
}
