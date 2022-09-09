// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mentor_courses_fetch_request_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MentorCoursesFetchRequestParams _$MentorCoursesFetchRequestParamsFromJson(
        Map<String, dynamic> json) =>
    MentorCoursesFetchRequestParams(
      mentorId: json['mentor_id'] as String?,
      page: json['page'] as int?,
    );

Map<String, dynamic> _$MentorCoursesFetchRequestParamsToJson(
        MentorCoursesFetchRequestParams instance) =>
    <String, dynamic>{
      'mentor_id': instance.mentorId,
      'page': instance.page,
    };
