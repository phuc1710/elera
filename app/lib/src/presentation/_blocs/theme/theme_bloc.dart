import 'dart:async';

import 'package:app_ui/app_ui.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'theme_event.dart';
part 'theme_state.dart';

@injectable
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(theme: AppTheme.light)) {
    on<ThemeEvent>(onThemeChanged);
  }

  Future<void> onThemeChanged(
    ThemeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final theme = event.value ? AppTheme.dark : AppTheme.light;
    emit(ThemeState(theme: theme));
  }
}
