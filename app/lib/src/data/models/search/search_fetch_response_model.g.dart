// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_fetch_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchFetchResponseModel _$SearchFetchResponseModelFromJson(
        Map<String, dynamic> json) =>
    SearchFetchResponseModel(
      status: json['status'] as int?,
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchFetchResponseModelToJson(
        SearchFetchResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      courses: json['courses'] == null
          ? null
          : Courses.fromJson(json['courses'] as Map<String, dynamic>),
      mentors: json['mentors'] == null
          ? null
          : Mentors.fromJson(json['mentors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'courses': instance.courses,
      'mentors': instance.mentors,
    };

Courses _$CoursesFromJson(Map<String, dynamic> json) => Courses(
      page: json['page'] as int?,
      total: json['total'] as int?,
      isMore: json['isMore'] as bool?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => CoursesItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CoursesToJson(Courses instance) => <String, dynamic>{
      'page': instance.page,
      'total': instance.total,
      'isMore': instance.isMore,
      'items': instance.items,
    };

CoursesItem _$CoursesItemFromJson(Map<String, dynamic> json) => CoursesItem(
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

Map<String, dynamic> _$CoursesItemToJson(CoursesItem instance) =>
    <String, dynamic>{
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

Mentors _$MentorsFromJson(Map<String, dynamic> json) => Mentors(
      page: json['page'] as int?,
      total: json['total'] as int?,
      isMore: json['isMore'] as bool?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => MentorsItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MentorsToJson(Mentors instance) => <String, dynamic>{
      'page': instance.page,
      'total': instance.total,
      'isMore': instance.isMore,
      'items': instance.items,
    };

MentorsItem _$MentorsItemFromJson(Map<String, dynamic> json) => MentorsItem(
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

Map<String, dynamic> _$MentorsItemToJson(MentorsItem instance) =>
    <String, dynamic>{
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
