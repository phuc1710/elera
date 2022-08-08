part of 'locale_bloc.dart';

@immutable
class LocaleState extends Equatable {
  const LocaleState({this.locale});

  final Locale? locale;

  @override
  List<Object?> get props => [locale];
}
