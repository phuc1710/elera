import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/network/api.dart';
import '../../../core/utils/constants.dart';
import '../../../data/models/language/language_response_model.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageInitial()) {
    on<LanguageEvent>((event, emit) {});

    on<LanguageStarted>(_fetchLanguages);
  }

  Future<void> _fetchLanguages(
    LanguageStarted event,
    Emitter<LanguageState> emit,
  ) async {
    emit(LanguageInProgress());
    try {
      final res = await Api.getLanguages();
      if (res?.status == StatusCode.success) {
        emit(
          LanguageFetchSuccess(
            suggested: res?.data?.suggested ?? [],
            languages: res?.data?.languages ?? [],
          ),
        );
      } else {
        emit(LanguageFailure(msg: res?.message));
      }
    } catch (_) {
      emit(const LanguageFailure());
    }
  }
}
