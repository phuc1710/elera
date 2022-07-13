import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/params/home_fetch_request_params.dart';
import '../../../../core/resources/api_error.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/constants.dart';
import '../../../../data/models/home/home_fetch_response_model.dart';
import '../../../../domain/usecases/get_course_list_usecase.dart';
import '../../../../domain/usecases/get_home_fetch_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.courseFetchUseCase, this.dealFetchUseCase)
      : super(HomeFetchInitial()) {
    on<HomeFetched>(_onHomeFetched);
  }

  final CourseFetchUseCase courseFetchUseCase;
  final HomeFetchUseCase dealFetchUseCase;

  Future<void> _onHomeFetched(
    HomeFetched event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeFetchInProgress());
    final dataState = await dealFetchUseCase(
      params: HomeFetchRequestParams(),
    );
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (dataState.data?.errorCode == ErrorCode.success)
        emit(HomeFetchSuccess(res?.data));
      else
        emit(
          HomeFetchFailure(
            ApiError(errorCode: res?.errorCode, errorMessage: res?.message),
          ),
        );
    }
    if (dataState is DataFailed) {
      emit(
        HomeFetchFailure(
          ApiError(errorMessage: dataState.error?.message),
        ),
      );
    }
  }
}
