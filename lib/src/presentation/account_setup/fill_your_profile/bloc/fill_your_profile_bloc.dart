import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../../core/params/fill_your_profile_request_params.dart';
import '../../../../core/resources/api_error.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/constants.dart';
import '../../../../domain/usecases/fill_your_profile_usecase.dart';

part 'fill_your_profile_event.dart';
part 'fill_your_profile_state.dart';

class FillYourProfileBloc
    extends Bloc<FillYourProfileEvent, FillYourProfileState> {
  FillYourProfileBloc(this.fillYourProfileUseCase)
      : super(FillYourProfileInitial()) {
    on<FillYourProfileSubmitted>(_onFillYourProfileSubmitted);
  }

  final FillYourProfileUseCase fillYourProfileUseCase;

  Future<void> _onFillYourProfileSubmitted(
    FillYourProfileSubmitted event,
    Emitter<FillYourProfileState> emit,
  ) async {
    emit(FillYourProfileLoading());
    final dataState = await fillYourProfileUseCase(
      params: FillYourProfileRequestParams(
        fullName: event.fullName,
        nickname: event.nickname,
        dateOfBirth: event.dateOfBirth,
        email: event.email,
        phoneNumber: event.phoneNumber,
        gender: event.gender,
      ),
    );
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (dataState.data?.errorCode == ErrorCode.success)
        emit(FillYourProfileSuccess());
      else
        emit(
          FillYourProfileFailed(
            ApiError(errorCode: res?.errorCode, errorMessage: res?.message),
          ),
        );
    }
    if (dataState is DataFailed) {
      emit(
        FillYourProfileFailed(
          ApiError(errorMessage: dataState.error?.message),
        ),
      );
    }
  }
}
