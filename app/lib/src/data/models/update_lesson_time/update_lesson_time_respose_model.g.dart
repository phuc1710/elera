// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_lesson_time_respose_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateLessonTimeResponseModel _$UpdateLessonTimeResponseModelFromJson(
        Map<String, dynamic> json) =>
    UpdateLessonTimeResponseModel(
      status: json['status'] as int?,
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateLessonTimeResponseModelToJson(
        UpdateLessonTimeResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data();

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{};
