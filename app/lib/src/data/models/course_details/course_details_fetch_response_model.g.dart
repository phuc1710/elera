// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_details_fetch_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseDetailsFetchResponseModel _$CourseDetailsFetchResponseModelFromJson(
        Map<String, dynamic> json) =>
    CourseDetailsFetchResponseModel(
      status: json['status'] as int?,
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Datum.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CourseDetailsFetchResponseModelToJson(
        CourseDetailsFetchResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
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
      totalTime: json['total_time'] as int?,
      aboutCourse: json['about_course'] as String?,
      mentor: json['mentor'] == null
          ? null
          : Mentor.fromJson(json['mentor'] as Map<String, dynamic>),
      tools: (json['tools'] as List<dynamic>?)
          ?.map((e) => Tool.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
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
      'total_time': instance.totalTime,
      'about_course': instance.aboutCourse,
      'mentor': instance.mentor,
      'tools': instance.tools,
    };

Price _$PriceFromJson(Map<String, dynamic> json) => Price(
      vn: json['vn'] as int?,
      en: json['en'] as int?,
    );

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
      'vn': instance.vn,
      'en': instance.en,
    };

Mentor _$MentorFromJson(Map<String, dynamic> json) => Mentor(
      id: json['id'] as String?,
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      career: json['career'] as String?,
    );

Map<String, dynamic> _$MentorToJson(Mentor instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
      'career': instance.career,
    };

Tool _$ToolFromJson(Map<String, dynamic> json) => Tool(
      icon: json['icon'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ToolToJson(Tool instance) => <String, dynamic>{
      'icon': instance.icon,
      'name': instance.name,
    };
