import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ez_intl/l10n/arb/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/usecases/language_usecase.dart';

part 'locale_event.dart';
part 'locale_state.dart';

@injectable
class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc(this._languageUC)
      : super(LocaleState(locale: AppLocalizations.supportedLocales[0])) {
    on<LocaleCached>(_onLocaleCached);
    on<LocaleChanged>(_onLocaleChanged);
  }

  final LanguageUseCase _languageUC;

  Future<void> _onLocaleCached(
    LocaleCached event,
    Emitter<LocaleState> emit,
  ) async {
    final language = await _languageUC();
    switch (language?.name) {
      case 'English (US)':
        emit(LocaleState(locale: AppLocalizations.supportedLocales[0]));
        break;
      case 'Tiếng Việt':
        emit(LocaleState(locale: AppLocalizations.supportedLocales[1]));
        break;
    }
  }

  Future<void> _onLocaleChanged(
    LocaleChanged event,
    Emitter<LocaleState> emit,
  ) async {
    switch (event.locale) {
      case 'English (US)':
        emit(LocaleState(locale: AppLocalizations.supportedLocales[0]));
        break;
      case 'Tiếng Việt':
        emit(LocaleState(locale: AppLocalizations.supportedLocales[1]));
        break;
    }
  }
}
