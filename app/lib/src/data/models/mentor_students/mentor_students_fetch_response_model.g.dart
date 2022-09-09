// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mentor_students_fetch_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MentorStudentsFetchResponseModel _$MentorStudentsFetchResponseModelFromJson(
        Map<String, dynamic> json) =>
    MentorStudentsFetchResponseModel(
      status: json['status'] as int?,
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MentorStudentsFetchResponseModelToJson(
        MentorStudentsFetchResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      mentors: json['mentors'] == null
          ? null
          : Mentors.fromJson(json['mentors'] as Map<String, dynamic>),
      students: (json['students'] as List<dynamic>?)
          ?.map((e) => Student.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'mentors': instance.mentors,
      'students': instance.students,
    };

Mentors _$MentorsFromJson(Map<String, dynamic> json) => Mentors(
      items: json['items'] == null
          ? null
          : Items.fromJson(json['items'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MentorsToJson(Mentors instance) => <String, dynamic>{
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

Student _$StudentFromJson(Map<String, dynamic> json) => Student(
      id: json['id'] as String?,
      fullName: json['full_name'] as String?,
      nickname: json['nickname'] as String?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'nickname': instance.nickname,
      'avatar': instance.avatar,
    };
