// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_fetch_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseFetchResponseModel _$CourseFetchResponseModelFromJson(
        Map<String, dynamic> json) =>
    CourseFetchResponseModel(
      message: json['message'] as String?,
      errorCode: json['error_code'] as int?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CourseFetchResponseModelToJson(
        CourseFetchResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error_code': instance.errorCode,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      courseList: (json['course_list'] as List<dynamic>?)
          ?.map((e) => CourseList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'course_list': instance.courseList,
    };

CourseList _$CourseListFromJson(Map<String, dynamic> json) => CourseList(
      tag: json['tag'] as String?,
      courses: (json['courses'] as List<dynamic>?)
          ?.map((e) => Course.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseListToJson(CourseList instance) =>
    <String, dynamic>{
      'tag': instance.tag,
      'courses': instance.courses,
    };

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      tag: json['tag'] as String?,
      name: json['name'] as String?,
      imagePath: json['imagePath'] as String?,
      price: json['price'] as String?,
      originalPrice: json['original_price'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      studentCount: json['student_count'] as String?,
      isBookmarked: json['is_bookmarked'] as bool?,
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'tag': instance.tag,
      'name': instance.name,
      'imagePath': instance.imagePath,
      'price': instance.price,
      'original_price': instance.originalPrice,
      'rating': instance.rating,
      'student_count': instance.studentCount,
      'is_bookmarked': instance.isBookmarked,
    };
