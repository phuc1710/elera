// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseResponseModel _$CourseResponseModelFromJson(Map<String, dynamic> json) =>
    CourseResponseModel(
      status: json['status'] as int?,
      data: json['data'] == null
          ? null
          : CourseModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CourseResponseModelToJson(
  CourseResponseModel instance,
) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

CourseModel _$CourseModelFromJson(Map<String, dynamic> json) => CourseModel(
      (json['items'] as List<dynamic>?)
              ?.map(
                (dynamic e) => e == null
                    ? null
                    : CourseModelItem.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          [],
    );

Map<String, dynamic> _$CourseModelToJson(CourseModel instance) =>
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
