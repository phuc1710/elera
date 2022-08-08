import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'theme_event.dart';
part 'theme_state.dart';

@injectable
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<DarkThemeEnabled>(_onDarkThemeEnabled);
    on<DarkThemeDisabled>(_onDarkThemeDisabled);
  }

  Future<void> _onDarkThemeEnabled(
    DarkThemeEnabled event,
    Emitter<ThemeState> emit,
  ) async {
    emit(DarkThemeSuccess());
  }

  Future<void> _onDarkThemeDisabled(
    DarkThemeDisabled event,
    Emitter<ThemeState> emit,
  ) async {
    emit(LightThemeSuccess());
  }
}
