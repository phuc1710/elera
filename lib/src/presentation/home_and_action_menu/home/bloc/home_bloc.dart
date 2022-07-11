import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/params/course_fetch_request_params.dart';
import '../../../../core/resources/api_error.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/constants.dart';
import '../../../../data/models/course/course_response_model.dart';
import '../../../../domain/usecases/get_course_list_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.courseFetchUseCase) : super(CourseFetchInitial()) {
    on<CourseFetched>(_onCourseFetched);
  }

  final CourseFetchUseCase courseFetchUseCase;

  Future<void> _onCourseFetched(
    CourseFetched event,
    Emitter<HomeState> emit,
  ) async {
    emit(CourseFetchInProgress());
    final dataState = await courseFetchUseCase(
      params: CourseFetchRequestParams(),
    );
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (dataState.data?.errorCode == ErrorCode.success)
        emit(CourseFetchSuccess(res?.data?.courseList ?? []));
      else
        emit(
          CourseFetchFailure(
            ApiError(errorCode: res?.errorCode, errorMessage: res?.message),
          ),
        );
    }
    if (dataState is DataFailed) {
      emit(
        CourseFetchFailure(
          ApiError(errorMessage: dataState.error?.message),
        ),
      );
    }
  }
}
