// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_fetch_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookmarkFetchResponseModel _$BookmarkFetchResponseModelFromJson(
        Map<String, dynamic> json) =>
    BookmarkFetchResponseModel(
      message: json['message'] as String?,
      code: json['code'] as int?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookmarkFetchResponseModelToJson(
        BookmarkFetchResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      bookmarkCourses: (json['bookmark_courses'] as List<dynamic>?)
          ?.map((e) => CourseList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'bookmark_courses': instance.bookmarkCourses,
    };
