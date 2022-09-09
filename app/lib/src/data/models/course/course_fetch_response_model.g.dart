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
      page: json['page'] as String?,
      isMore: json['is_more'] as bool?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      courses: (json['courses'] as List<dynamic>?)
          ?.map((e) => Course.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'page': instance.page,
      'is_more': instance.isMore,
      'categories': instance.categories,
      'courses': instance.courses,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as String?,
      name: json['name'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
    };

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      id: json['id'] as String?,
      categoryName: json['category_name'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      thumbnail: json['thumbnail'] as String?,
      discountPrice: json['discount_price'] == null
          ? null
          : Price.fromJson(json['discount_price'] as Map<String, dynamic>),
      originalPrice: json['original_price'] == null
          ? null
          : Price.fromJson(json['original_price'] as Map<String, dynamic>),
      rating: (json['rating'] as num?)?.toDouble(),
      enrollCount: json['enroll_count'] as int?,
      isBookmarked: json['is_bookmarked'] as bool?,
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'category_name': instance.categoryName,
      'name': instance.name,
      'image': instance.image,
      'thumbnail': instance.thumbnail,
      'discount_price': instance.discountPrice,
      'original_price': instance.originalPrice,
      'rating': instance.rating,
      'enroll_count': instance.enrollCount,
      'is_bookmarked': instance.isBookmarked,
    };

Price _$PriceFromJson(Map<String, dynamic> json) => Price(
      vn: json['vn'] as int?,
      en: json['en'] as int?,
    );

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
      'vn': instance.vn,
      'en': instance.en,
    };
