// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_reviews_fetch_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseReviewsFetchResponseModel _$CourseReviewsFetchResponseModelFromJson(
        Map<String, dynamic> json) =>
    CourseReviewsFetchResponseModel(
      status: json['status'] as int?,
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CourseReviewsFetchResponseModelToJson(
        CourseReviewsFetchResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'items': instance.items,
    };

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      courseId: json['course_id'] as String?,
      rating: json['rating'] as int?,
      content: json['content'] as String?,
      likeCount: json['like_count'] as int?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'course_id': instance.courseId,
      'rating': instance.rating,
      'content': instance.content,
      'like_count': instance.likeCount,
      'user': instance.user,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String?,
      fullName: json['full_name'] as String?,
      nickname: json['nickname'] as String?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'nickname': instance.nickname,
      'avatar': instance.avatar,
    };
