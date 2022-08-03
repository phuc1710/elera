// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_fetch_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeFetchResponseModel _$HomeFetchResponseModelFromJson(
        Map<String, dynamic> json) =>
    HomeFetchResponseModel(
      message: json['message'] as String?,
      errorCode: json['error_code'] as int?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomeFetchResponseModelToJson(
        HomeFetchResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error_code': instance.errorCode,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      deals: (json['deals'] as List<dynamic>?)
          ?.map((e) => Deal.fromJson(e as Map<String, dynamic>))
          .toList(),
      mentors: (json['mentors'] as List<dynamic>?)
          ?.map((e) => Mentor.fromJson(e as Map<String, dynamic>))
          .toList(),
      courseList: (json['course_list'] as List<dynamic>?)
          ?.map((e) => CourseList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'deals': instance.deals,
      'mentors': instance.mentors,
      'course_list': instance.courseList,
    };

Deal _$DealFromJson(Map<String, dynamic> json) => Deal(
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      description: json['description'] as String?,
      deal: json['deal'] as String?,
    );

Map<String, dynamic> _$DealToJson(Deal instance) => <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'description': instance.description,
      'deal': instance.deal,
    };

Mentor _$MentorFromJson(Map<String, dynamic> json) => Mentor(
      nickname: json['nickname'] as String?,
      fullname: json['fullname'] as String?,
      description: json['description'] as String?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$MentorToJson(Mentor instance) => <String, dynamic>{
      'nickname': instance.nickname,
      'fullname': instance.fullname,
      'description': instance.description,
      'avatar': instance.avatar,
    };
