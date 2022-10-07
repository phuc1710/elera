import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/params/my_course_detail_fetch_request_params.dart';
import '../../../../core/resources/api_error.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/constants.dart';
import '../../../../data/models/my_course_detail/my_course_detail_fetch_response_model.dart';
import '../../../../domain/usecases/get_my_course_detail_fetch_usecase.dart';

part 'my_complete_course_event.dart';
part 'my_complete_course_state.dart';

@injectable
class MyCompleteCourseBloc
    extends Bloc<MyCompleteCourseEvent, MyCompleteCourseState> {
  MyCompleteCourseBloc(this.myCourseDetailFetchUseCase)
      : super(MyCompleteCourseInitial()) {
    on<MyCompleteCourseFetched>(_onMyCompleteCourseFetched);
  }

  final MyCourseDetailFetchUseCase myCourseDetailFetchUseCase;

  Future<void> _onMyCompleteCourseFetched(
    MyCompleteCourseFetched event,
    Emitter<MyCompleteCourseState> emit,
  ) async {
    emit(MyCompleteCourseFetchInProgress());
    final dataState = await myCourseDetailFetchUseCase(
      params: MyCourseDetailFetchRequestParams(event.courseId),
    );
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (dataState.data?.code == ErrorCode.success)
        emit(MyCompleteCourseFetchSuccess(res?.data));
      else
        emit(
          MyCompleteCourseFetchFailure(
            ApiError(errorCode: res?.code, errorMessage: res?.message),
          ),
        );
    }
    if (dataState is DataFailed) {
      emit(
        MyCompleteCourseFetchFailure(
          ApiError(errorMessage: dataState.error?.message),
        ),
      );
    }
  }
}
