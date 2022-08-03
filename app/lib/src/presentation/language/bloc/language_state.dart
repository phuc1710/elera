part of 'language_bloc.dart';

abstract class LanguageState extends Equatable {
  const LanguageState();

  @override
  List<Object?> get props => [];
}

class LanguageInitial extends LanguageState {}

class LanguageInProgress extends LanguageState {}

class LanguageFailure extends LanguageState {
  const LanguageFailure({this.msg});

  final String? msg;

  @override
  List<Object?> get props => [msg];
}

class LanguageFetchSuccess extends LanguageState {
  const LanguageFetchSuccess({
    required this.suggested,
    required this.languages,
  });

  final List<LanguageModel?> suggested;
  final List<LanguageModel?> languages;

  @override
  List<Object?> get props => [suggested, languages];
}
