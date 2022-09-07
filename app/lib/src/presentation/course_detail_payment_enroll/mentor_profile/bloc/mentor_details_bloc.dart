import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/params/mentor_courses_fetch_request_params.dart';
import '../../../../core/params/mentor_students_fetch_request_params.dart';
import '../../../../core/resources/api_error.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/constants.dart';
import '../../../../data/models/mentor_courses/mentor_courses_fetch_response_model.dart'
    as mentor_course;
import '../../../../data/models/mentor_students/mentor_students_fetch_response_model.dart'
    as mentor_student;
import 'package:flutter/material.dart';

import '../../../../domain/usecases/get_mentor_courses_fetch_usecase.dart';
import '../../../../domain/usecases/get_mentor_students_fetch_usecase.dart';

part 'mentor_details_event.dart';
part 'mentor_details_state.dart';

@injectable
class MentorDetailsBloc extends Bloc<MentorDetailsEvent, MentorDetailsState> {
  MentorDetailsBloc(
    this.mentorCoursesFetchUseCase,
    this.mentorStudentsFetchUseCase,
  ) : super(MentorDetailsFetchInitial()) {
    on<MentorCoursesFetched>(_onMentorCoursesFetched);
    on<MentorStudentsFetched>(_onMentorStudentsFetched);
  }

  final MentorCoursesFetchUseCase mentorCoursesFetchUseCase;
  final MentorStudentsFetchUseCase mentorStudentsFetchUseCase;

  Future<void> _onMentorCoursesFetched(
    MentorCoursesFetched event,
    Emitter<MentorDetailsState> emit,
  ) async {
    emit(MentorCoursesFetchInProgress());
    final dataState = await mentorCoursesFetchUseCase(
      params: MentorCoursesFetchRequestParams(
        mentorId: '62ea2afa330425187d477882',
        page: 1,
      ),
    );
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (dataState.data?.code == ErrorCode.success)
        emit(MentorCoursesFetchSuccess(res?.data));
      else
        emit(
          MentorCoursesFetchFailure(
            ApiError(errorCode: res?.code, errorMessage: res?.message),
          ),
        );
    }
    if (dataState is DataFailed) {
      emit(
        MentorCoursesFetchFailure(
          ApiError(errorMessage: dataState.error?.message),
        ),
      );
    }
  }

  Future<void> _onMentorStudentsFetched(
    MentorStudentsFetched event,
    Emitter<MentorDetailsState> emit,
  ) async {
    emit(MentorStudentsFetchInProgress());
    final dataState = await mentorStudentsFetchUseCase(
      params: MentorStudentsFetchRequestParams(
        mentorId: '62ea2afa330425187d477882',
      ),
    );
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (dataState.data?.code == ErrorCode.success)
        emit(MentorStudentsFetchSuccess(res?.data));
      else
        emit(
          MentorStudentsFetchFailure(
            ApiError(errorCode: res?.code, errorMessage: res?.message),
          ),
        );
    }
    if (dataState is DataFailed) {
      emit(
        MentorStudentsFetchFailure(
          ApiError(errorMessage: dataState.error?.message),
        ),
      );
    }
  }
}
