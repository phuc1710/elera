part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object?> get props => [];
}

class LanguageStarted extends LanguageEvent {}

class LanguageSaved extends LanguageEvent {
  const LanguageSaved(this.language);

  final LanguageModel? language;

  @override
  List<Object?> get props => [language];
}
