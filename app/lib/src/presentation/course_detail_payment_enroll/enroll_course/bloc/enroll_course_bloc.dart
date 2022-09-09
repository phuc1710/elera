import 'dart:async';

import 'package:bloc/bloc.dart';
import '../../../../core/params/enroll_course_request_params.dart';
import '../../../../data/models/enroll_course/enroll_course_response_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/resources/api_error.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/constants.dart';
import '../../../../data/models/payment/payment_response_model.dart';
import '../../../../domain/usecases/get_payments_usecase.dart';
import '../../../../domain/usecases/post_enroll_course_usecase.dart';

part 'enroll_course_event.dart';
part 'enroll_course_state.dart';

@injectable
class EnrollCourseBloc extends Bloc<EnrollCourseEvent, EnrollCourseState> {
  EnrollCourseBloc(this.getPaymentsUseCase, this.postEnrollCourseUseCase)
      : super(EnrollCourseInitial()) {
    on<EnrollCoursePaymentFetched>(_onEnrollCoursePaymentFetched);
    on<EnrollCourseSubmitted>(_onEnrollCourseSubmitted);
  }

  final GetPaymentsUseCase getPaymentsUseCase;
  final PostEnrollCourseUseCase postEnrollCourseUseCase;

  Future<void> _onEnrollCoursePaymentFetched(
    EnrollCoursePaymentFetched event,
    Emitter<EnrollCourseState> emit,
  ) async {
    emit(EnrollCoursePaymentFetchInProgress());
    final dataState = await getPaymentsUseCase();
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (dataState.data?.code == ErrorCode.success)
        emit(EnrollCoursePaymentFetchSuccess(res?.data));
      else
        emit(
          EnrollCoursePaymentFetchFailure(
            ApiError(errorCode: res?.code, errorMessage: res?.message),
          ),
        );
    }
    if (dataState is DataFailed) {
      emit(
        EnrollCoursePaymentFetchFailure(
          ApiError(errorMessage: dataState.error?.message),
        ),
      );
    }
  }

  Future<void> _onEnrollCourseSubmitted(
    EnrollCourseSubmitted event,
    Emitter<EnrollCourseState> emit,
  ) async {
    emit(EnrollCourseSubmissionInProgress());
    final dataState = await postEnrollCourseUseCase(
      params: EnrollCourseRequestParams(event.paymentMethod),
    );
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (dataState.data?.code == ErrorCode.success)
        emit(EnrollCourseSubmissionSuccess(res?.data));
      else
        emit(
          EnrollCourseSubmissionFailure(
            ApiError(errorCode: res?.code, errorMessage: res?.message),
          ),
        );
    }
    if (dataState is DataFailed) {
      emit(
        EnrollCourseSubmissionFailure(
          ApiError(errorMessage: dataState.error?.message),
        ),
      );
    }
  }
}
