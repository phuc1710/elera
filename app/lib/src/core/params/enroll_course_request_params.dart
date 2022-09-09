import 'package:json_annotation/json_annotation.dart';

part 'enroll_course_request_params.g.dart';

@JsonSerializable()
class EnrollCourseRequestParams {
  EnrollCourseRequestParams(this.paymentMethod);

  factory EnrollCourseRequestParams.fromJson(Map<String, dynamic> json) =>
      _$EnrollCourseRequestParamsFromJson(json);

  @JsonKey(name: 'payment_method')
  final String? paymentMethod;

  Map<String, dynamic> toJson() =>
      _$EnrollCourseRequestParamsToJson(this);
}
