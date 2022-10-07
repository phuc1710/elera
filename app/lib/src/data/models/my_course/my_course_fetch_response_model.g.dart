// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_course_fetch_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyCourseFetchResponseModel _$MyCourseFetchResponseModelFromJson(
        Map<String, dynamic> json) =>
    MyCourseFetchResponseModel(
      status: json['status'] as int?,
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyCourseFetchResponseModelToJson(
        MyCourseFetchResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'data': instance.data,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      status: json['status'] as String?,
      courses: (json['courses'] as List<dynamic>?)
          ?.map((e) => Course.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'status': instance.status,
      'courses': instance.courses,
    };

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      courseId: json['course_id'] as String?,
      status: json['status'] as String?,
      courseInfo: json['course_info'] == null
          ? null
          : CourseInfo.fromJson(json['course_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'course_id': instance.courseId,
      'status': instance.status,
      'course_info': instance.courseInfo,
    };

CourseInfo _$CourseInfoFromJson(Map<String, dynamic> json) => CourseInfo(
      name: json['name'] as String?,
      totalTime: json['total_time'] as int?,
      lessonCount: json['lesson_count'] as int?,
      completeLesson: json['complete_lesson'] as int?,
    );

Map<String, dynamic> _$CourseInfoToJson(CourseInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'total_time': instance.totalTime,
      'lesson_count': instance.lessonCount,
      'complete_lesson': instance.completeLesson,
    };
