import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/params/mentor_fetch_request_params.dart';
import '../../../../core/resources/api_error.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/constants.dart';
import '../../../../data/models/mentor/mentor_fetch_response_model.dart';
import '../../../../domain/usecases/get_mentor_fetch_usecase.dart';

part 'top_mentors_event.dart';
part 'top_mentors_state.dart';

@injectable
class TopMentorsBloc extends Bloc<TopMentorsEvent, TopMentorsState> {
  TopMentorsBloc(this.mentorFetchUseCase) : super(TopMentorsFetchInitial()) {
    on<TopMentorsFetched>(_onTopMentorsFetched);
  }

  final MentorFetchUseCase mentorFetchUseCase;

  Future<void> _onTopMentorsFetched(
    TopMentorsFetched event,
    Emitter<TopMentorsState> emit,
  ) async {
    emit(TopMentorsFetchInProgress());
    final dataState = await mentorFetchUseCase(
      params: MentorFetchRequestParams(),
    );
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (dataState.data?.code == ErrorCode.success)
        emit(TopMentorsFetchSuccess(res?.data));
      else
        emit(
          TopMentorsFetchFailure(
            ApiError(errorCode: res?.code, errorMessage: res?.message),
          ),
        );
    }
    if (dataState is DataFailed) {
      emit(
        TopMentorsFetchFailure(
          ApiError(errorMessage: dataState.error?.message),
        ),
      );
    }
  }
}
