// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enroll_course_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnrollCourseResponseModel _$EnrollCourseResponseModelFromJson(
        Map<String, dynamic> json) =>
    EnrollCourseResponseModel(
      status: json['status'] as int?,
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EnrollCourseResponseModelToJson(
        EnrollCourseResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      token: json['token'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'token': instance.token,
    };
