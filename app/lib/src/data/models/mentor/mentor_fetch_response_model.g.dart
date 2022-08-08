// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mentor_fetch_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MentorFetchResponseModel _$MentorFetchResponseModelFromJson(
        Map<String, dynamic> json) =>
    MentorFetchResponseModel(
      status: json['status'] as int?,
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MentorFetchResponseModelToJson(
        MentorFetchResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      mentors: (json['mentors'] as List<dynamic>?)
          ?.map((e) => Mentor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'mentors': instance.mentors,
    };

Mentor _$MentorFromJson(Map<String, dynamic> json) => Mentor(
      name: json['name'] as String?,
      description: json['description'] as String?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$MentorToJson(Mentor instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'avatar': instance.avatar,
    };
