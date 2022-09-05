// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mentor_details_fetch_request_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MentorDetailsFetchRequestParams _$MentorDetailsFetchRequestParamsFromJson(
        Map<String, dynamic> json) =>
    MentorDetailsFetchRequestParams(
      mentorId: json['mentor_id'] as String?,
      page: json['page'] as int?,
    );

Map<String, dynamic> _$MentorDetailsFetchRequestParamsToJson(
        MentorDetailsFetchRequestParams instance) =>
    <String, dynamic>{
      'mentor_id': instance.mentorId,
      'page': instance.page,
    };
