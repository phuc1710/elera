// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_fetch_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseFetchResponseModel _$CourseFetchResponseModelFromJson(
        Map<String, dynamic> json) =>
    CourseFetchResponseModel(
      status: json['status'] as int?,
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CourseFetchResponseModelToJson(
        CourseFetchResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
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
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseListToJson(CourseList instance) =>
    <String, dynamic>{
      'tag': instance.tag,
      'items': instance.items,
    };

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      categoryName: json['category_name'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      discountPrice: json['discount_price'] as String?,
      originalPrice: json['original_price'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      enrollCount: json['enroll_count'] as String?,
      isBookmarked: json['is_bookmarked'] as bool?,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'category_name': instance.categoryName,
      'name': instance.name,
      'image': instance.image,
      'discount_price': instance.discountPrice,
      'original_price': instance.originalPrice,
      'rating': instance.rating,
      'enroll_count': instance.enrollCount,
      'is_bookmarked': instance.isBookmarked,
    };
