import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/params/course_fetch_request_params.dart';
import '../../../../core/params/deal_fetch_request_params.dart';
import '../../../../core/resources/api_error.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/constants.dart';
import '../../../../data/models/course/course_response_model.dart';
import '../../../../data/models/deal/deal_fetch_response_model.dart';
import '../../../../domain/usecases/get_course_list_usecase.dart';
import '../../../../domain/usecases/get_deal_fetch_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.courseFetchUseCase, this.dealFetchUseCase)
      : super(CourseFetchInitial()) {
    on<CourseFetched>(_onCourseFetched);
    on<DealFetched>(_onDealFetched);
  }

  final CourseFetchUseCase courseFetchUseCase;
  final DealFetchUseCase dealFetchUseCase;

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

  Future<void> _onDealFetched(
    DealFetched event,
    Emitter<HomeState> emit,
  ) async {
    emit(DealFetchInProgress());
    final dataState = await dealFetchUseCase(
      params: DealFetchRequestParams(),
    );
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (dataState.data?.errorCode == ErrorCode.success)
        emit(DealFetchSuccess(res?.data?.deals ?? []));
      else
        emit(
          DealFetchFailure(
            ApiError(errorCode: res?.errorCode, errorMessage: res?.message),
          ),
        );
    }
    if (dataState is DataFailed) {
      emit(
        DealFetchFailure(
          ApiError(errorMessage: dataState.error?.message),
        ),
      );
    }
  }
}
