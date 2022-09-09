import 'package:json_annotation/json_annotation.dart';

part 'enroll_course_response_model.g.dart';

@JsonSerializable()
class EnrollCourseResponseModel {
  EnrollCourseResponseModel({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });
  factory EnrollCourseResponseModel.fromJson(Map<String, dynamic> json) =>
      _$EnrollCourseResponseModelFromJson(json);

  final int? status;
  final int? code;
  final String? message;
  final Data? data;

  Map<String, dynamic> toJson() => _$EnrollCourseResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    required this.token,
  });
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  final String? token;

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
