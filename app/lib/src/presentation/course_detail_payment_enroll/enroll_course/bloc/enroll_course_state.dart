part of 'enroll_course_bloc.dart';

abstract class EnrollCourseState {}

class EnrollCourseInitial extends EnrollCourseState {}

class EnrollCoursePaymentFetchInProgress extends EnrollCourseState {}

class EnrollCoursePaymentFetchSuccess extends EnrollCourseState {
  EnrollCoursePaymentFetchSuccess(this.paymentData);

  final PaymentDataModel? paymentData;
}

class EnrollCoursePaymentFetchFailure extends EnrollCourseState {
  EnrollCoursePaymentFetchFailure(this.error);

  final ApiError error;
}

class EnrollCourseSubmissionInProgress extends EnrollCourseState {}

class EnrollCourseSubmissionSuccess extends EnrollCourseState {
  EnrollCourseSubmissionSuccess(this.data);

  final Data? data;
}

class EnrollCourseSubmissionFailure extends EnrollCourseState {
  EnrollCourseSubmissionFailure(this.error);

  final ApiError error;
}
