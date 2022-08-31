import 'package:json_annotation/json_annotation.dart';

part 'course_reviews_fetch_response_model.g.dart';

@JsonSerializable()
class CourseReviewsFetchResponseModel {
  CourseReviewsFetchResponseModel({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });
  factory CourseReviewsFetchResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CourseReviewsFetchResponseModelFromJson(json);

  final int? status;
  final int? code;
  final String? message;
  final Data? data;

  Map<String, dynamic> toJson() =>
      _$CourseReviewsFetchResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    required this.items,
  });
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  final List<Item>? items;

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Item {
  Item({
    required this.courseId,
    required this.rating,
    required this.content,
    required this.likeCount,
    required this.user,
  });
  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  @JsonKey(name: 'course_id')
  final String? courseId;
  final int? rating;
  final String? content;

  @JsonKey(name: 'like_count')
  final int? likeCount;
  final User? user;

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

@JsonSerializable()
class User {
  User({
    required this.id,
    required this.fullName,
    required this.nickname,
    required this.avatar,
  });
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  final String? id;

  @JsonKey(name: 'full_name')
  final String? fullName;
  final String? nickname;
  final String? avatar;

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
