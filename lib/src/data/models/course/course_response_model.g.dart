// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseFetchResponseModel _$CourseFetchResponseModelFromJson(
        Map<String, dynamic> json) =>
    CourseFetchResponseModel(
      errorCode: json['error_code'] as int?,
      data: json['data'] == null
          ? null
          : CourseFetchModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CourseFetchResponseModelToJson(
        CourseFetchResponseModel instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'message': instance.message,
      'data': instance.data,
    };

CourseFetchModel _$CourseFetchModelFromJson(Map<String, dynamic> json) =>
    CourseFetchModel(
      (json['items'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : CourseModelItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$CourseFetchModelToJson(CourseFetchModel instance) =>
    <String, dynamic>{
      'items': instance.courseList,
    };

CourseModelItem _$CourseModelItemFromJson(Map<String, dynamic> json) =>
    CourseModelItem(
      json['tag'] as String,
      json['name'] as String,
      json['imagePath'] as String,
      json['price'] as String,
      json['original_price'] as String,
      (json['rating'] as num).toDouble(),
      json['student_count'] as String,
      json['is_bookmarked'] as bool,
    );

Map<String, dynamic> _$CourseModelItemToJson(CourseModelItem instance) =>
    <String, dynamic>{
      'tag': instance.tag,
      'name': instance.name,
      'imagePath': instance.imagePath,
      'price': instance.price,
      'original_price': instance.originalPrice,
      'rating': instance.rating,
      'student_count': instance.studentCount,
      'is_bookmarked': instance.isBookmarked,
    };
