// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_fetch_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeFetchResponseModel _$HomeFetchResponseModelFromJson(
        Map<String, dynamic> json) =>
    HomeFetchResponseModel(
      status: json['status'] as int?,
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomeFetchResponseModelToJson(
        HomeFetchResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      banners: (json['banners'] as List<dynamic>?)
          ?.map((e) => Banner.fromJson(e as Map<String, dynamic>))
          .toList(),
      mentors: (json['mentors'] as List<dynamic>?)
          ?.map((e) => Mentor.fromJson(e as Map<String, dynamic>))
          .toList(),
      popularCourses: (json['popular_courses'] as List<dynamic>?)
          ?.map((e) => Course.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'banners': instance.banners,
      'mentors': instance.mentors,
      'popular_courses': instance.popularCourses,
    };

Banner _$BannerFromJson(Map<String, dynamic> json) => Banner(
      id: json['id'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$BannerToJson(Banner instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
    };

Mentor _$MentorFromJson(Map<String, dynamic> json) => Mentor(
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

Map<String, dynamic> _$MentorToJson(Mentor instance) => <String, dynamic>{
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
