import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/params/mentor_courses_fetch_request_params.dart';
import '../../../../core/resources/api_error.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/constants.dart';
import '../../../../data/models/mentor_courses/mentor_courses_fetch_response_model.dart';
import 'package:flutter/material.dart';

import '../../../../domain/usecases/get_mentor_courses_fetch_usecase.dart';

part 'mentor_details_event.dart';
part 'mentor_details_state.dart';

@injectable
class MentorDetailsBloc extends Bloc<MentorDetailsEvent, MentorDetailsState> {
  MentorDetailsBloc(this.mentorDetailsFetchUseCase)
      : super(MentorDetailsFetchInitial()) {
    on<MentorDetailsFetched>(_onMentorDetailsFetched);
  }

  final MentorCoursesFetchUseCase mentorDetailsFetchUseCase;

  Future<void> _onMentorDetailsFetched(
    MentorDetailsFetched event,
    Emitter<MentorDetailsState> emit,
  ) async {
    emit(MentorDetailsFetchInProgress());
    final dataState = await mentorDetailsFetchUseCase(
      params: MentorCoursesFetchRequestParams(
        mentorId: '62ea2afa330425187d477882',
        page: 1,
      ),
    );
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (dataState.data?.code == ErrorCode.success)
        emit(MentorDetailsFetchSuccess(res?.data));
      else
        emit(
          MentorDetailsFetchFailure(
            ApiError(errorCode: res?.code, errorMessage: res?.message),
          ),
        );
    }
    if (dataState is DataFailed) {
      emit(
        MentorDetailsFetchFailure(
          ApiError(errorMessage: dataState.error?.message),
        ),
      );
    }
  }
}
