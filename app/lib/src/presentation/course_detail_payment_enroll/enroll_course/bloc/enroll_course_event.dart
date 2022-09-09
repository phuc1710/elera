part of 'enroll_course_bloc.dart';

abstract class EnrollCourseEvent {}

class EnrollCoursePaymentFetched extends EnrollCourseEvent {}

class EnrollCourseSubmitted extends EnrollCourseEvent {
  EnrollCourseSubmitted(this.paymentMethod);

  final String? paymentMethod;
}
