// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mentor_reviews_fetch_request_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MentorReviewsFetchRequestParams _$MentorReviewsFetchRequestParamsFromJson(
        Map<String, dynamic> json) =>
    MentorReviewsFetchRequestParams(
      mentorId: json['mentor_id'] as String?,
      page: json['page'] as int?,
    );

Map<String, dynamic> _$MentorReviewsFetchRequestParamsToJson(
        MentorReviewsFetchRequestParams instance) =>
    <String, dynamic>{
      'mentor_id': instance.mentorId,
      'page': instance.page,
    };
