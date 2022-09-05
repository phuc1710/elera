// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mentor_details_fetch_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MentorDetailsFetchResponseModel _$MentorDetailsFetchResponseModelFromJson(
        Map<String, dynamic> json) =>
    MentorDetailsFetchResponseModel(
      status: json['status'] as int?,
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MentorDetailsFetchResponseModelToJson(
        MentorDetailsFetchResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      mentor: json['mentor'] == null
          ? null
          : Mentor.fromJson(json['mentor'] as Map<String, dynamic>),
      courses: json['courses'] == null
          ? null
          : Courses.fromJson(json['courses'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'mentor': instance.mentor,
      'courses': instance.courses,
    };

Courses _$CoursesFromJson(Map<String, dynamic> json) => Courses(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Course.fromJson(e as Map<String, dynamic>))
          .toList(),
      isMore: json['is_more'] as bool?,
    );

Map<String, dynamic> _$CoursesToJson(Courses instance) => <String, dynamic>{
      'items': instance.items,
      'is_more': instance.isMore,
    };

Mentor _$MentorFromJson(Map<String, dynamic> json) => Mentor(
      items: json['items'] == null
          ? null
          : Items.fromJson(json['items'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MentorToJson(Mentor instance) => <String, dynamic>{
      'items': instance.items,
    };

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
      id: json['id'] as String?,
      name: json['name'] as String?,
      nickname: json['nickname'] as String?,
      avatar: json['avatar'] as String?,
      career: json['career'] as String?,
      students: json['students'] as int?,
      courses: json['courses'] as int?,
      reviews: json['reviews'] as int?,
      website: json['website'] as String?,
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nickname': instance.nickname,
      'avatar': instance.avatar,
      'career': instance.career,
      'students': instance.students,
      'courses': instance.courses,
      'reviews': instance.reviews,
      'website': instance.website,
    };
