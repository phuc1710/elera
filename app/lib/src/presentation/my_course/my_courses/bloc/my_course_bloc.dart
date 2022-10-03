import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/params/my_course_fetch_request_params.dart';
import '../../../../core/resources/api_error.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/constants.dart';
import '../../../../data/models/my_course/my_course_fetch_response_model.dart';
import '../../../../domain/usecases/get_my_course_fetch_usecase.dart';

part 'my_course_event.dart';
part 'my_course_state.dart';

@injectable
class MyCourseBloc extends Bloc<MyCourseEvent, MyCourseState> {
  MyCourseBloc(this.myCourseFetchUseCase) : super(MyCourseFetchInitial()) {
    on<MyCourseFetched>(_onMyCourseFetched);
  }

  final MyCourseFetchUseCase myCourseFetchUseCase;

  Future<void> _onMyCourseFetched(
    MyCourseFetched event,
    Emitter<MyCourseState> emit,
  ) async {
    emit(MyCourseFetchInProgress());
    final dataState = await myCourseFetchUseCase(
      params: MyCourseFetchRequestParams(),
    );
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (dataState.data?.code == ErrorCode.success)
        emit(MyCourseFetchSuccess(res?.data));
      else
        emit(
          MyCourseFetchFailure(
            ApiError(errorCode: res?.code, errorMessage: res?.message),
          ),
        );
    }
    if (dataState is DataFailed) {
      emit(
        MyCourseFetchFailure(
          ApiError(errorMessage: dataState.error?.message),
        ),
      );
    }
  }
}
