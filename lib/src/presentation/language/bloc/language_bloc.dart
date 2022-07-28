import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../core/resources/data_state.dart';
import '../../../core/utils/constants.dart';
import '../../../data/models/language/language_response_model.dart';
import '../../../domain/usecases/get_languages_usecase.dart';

part 'language_event.dart';
part 'language_state.dart';

@injectable
class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc(this._getLanguagesUC) : super(LanguageInitial()) {
    on<LanguageEvent>((event, emit) {});

    on<LanguageStarted>(_fetchLanguages);
  }

  final GetLanguagesUseCase _getLanguagesUC;

  Future<void> _fetchLanguages(
    LanguageStarted event,
    Emitter<LanguageState> emit,
  ) async {
    emit(LanguageInProgress());

    final dataState = await _getLanguagesUC();
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (res?.code == ErrorCode.success) {
        emit(
          LanguageFetchSuccess(
            suggested: res?.data?.suggested ?? [],
            languages: res?.data?.languages ?? [],
          ),
        );
      } else {
        emit(LanguageFailure(msg: res?.message));
      }
    }
    if (dataState is DataFailed) {
      emit(LanguageFailure(msg: dataState.error?.message));
    }
  }
}
