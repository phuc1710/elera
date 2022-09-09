// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_reviews_fetch_request_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseReviewsFetchRequestParams _$CourseReviewsFetchRequestParamsFromJson(
        Map<String, dynamic> json) =>
    CourseReviewsFetchRequestParams(
      courseId: json['course_id'] as String?,
      rate: json['rate'] as String?,
      page: json['page'] as int?,
    );

Map<String, dynamic> _$CourseReviewsFetchRequestParamsToJson(
        CourseReviewsFetchRequestParams instance) =>
    <String, dynamic>{
      'course_id': instance.courseId,
      'rate': instance.rate,
      'page': instance.page,
    };
