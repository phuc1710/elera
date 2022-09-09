// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mentor_reviews_fetch_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MentorReviewsFetchResponseModel _$MentorReviewsFetchResponseModelFromJson(
        Map<String, dynamic> json) =>
    MentorReviewsFetchResponseModel(
      status: json['status'] as int?,
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MentorReviewsFetchResponseModelToJson(
        MentorReviewsFetchResponseModel instance) =>
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
      reviews: json['reviews'] == null
          ? null
          : Reviews.fromJson(json['reviews'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'mentors': instance.mentors,
      'reviews': instance.reviews,
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

Reviews _$ReviewsFromJson(Map<String, dynamic> json) => Reviews(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReviewsToJson(Reviews instance) => <String, dynamic>{
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
