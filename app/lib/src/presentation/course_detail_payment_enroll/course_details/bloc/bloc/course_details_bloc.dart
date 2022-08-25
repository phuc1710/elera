import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/params/course_details_fetch_request_params.dart';
import '../../../../../core/resources/api_error.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../data/models/course_details/course_details_fetch_response_model.dart';
import '../../../../../domain/usecases/get_course_details_fetch_usecase.dart';

part 'course_details_event.dart';
part 'course_details_state.dart';

@injectable
class CourseDetailsBloc extends Bloc<CourseDetailsEvent, CourseDetailsState> {
  CourseDetailsBloc(this.courseDetailsFetchUseCase)
      : super(CourseDetailsFetchInitial()) {
    on<CourseDetailsFetched>(_onCourseDetailsFetched);
  }

  final CourseDetailsFetchUseCase courseDetailsFetchUseCase;

  Future<void> _onCourseDetailsFetched(
    CourseDetailsFetched event,
    Emitter<CourseDetailsState> emit,
  ) async {
    emit(CourseDetailsFetchInProgress());
    final dataState = await courseDetailsFetchUseCase(
      params: CourseDetailsFetchRequestParams(courseId: '12345'),
    );
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (dataState.data?.code == ErrorCode.success)
        emit(CourseDetailsFetchSuccess(res?.data));
      else
        emit(
          CourseDetailsFetchFailure(
            ApiError(errorCode: res?.code, errorMessage: res?.message),
          ),
        );
    }
    if (dataState is DataFailed) {
      emit(
        CourseDetailsFetchFailure(
          ApiError(errorMessage: dataState.error?.message),
        ),
      );
    }
  }
}
