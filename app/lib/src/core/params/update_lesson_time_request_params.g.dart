// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_lesson_time_request_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateLessonTimeRequestParams _$UpdateLessonTimeRequestParamsFromJson(
        Map<String, dynamic> json) =>
    UpdateLessonTimeRequestParams(
      json['course_id'] as String?,
      json['lesson_id'] as String?,
      json['time'] as String?,
    );

Map<String, dynamic> _$UpdateLessonTimeRequestParamsToJson(
        UpdateLessonTimeRequestParams instance) =>
    <String, dynamic>{
      'course_id': instance.courseId,
      'lesson_id': instance.lessonId,
      'time': instance.time,
    };
