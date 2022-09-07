import 'package:json_annotation/json_annotation.dart';

part 'mentor_reviews_fetch_response_model.g.dart';

@JsonSerializable()
class MentorReviewsFetchResponseModel {
  MentorReviewsFetchResponseModel({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });
  factory MentorReviewsFetchResponseModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MentorReviewsFetchResponseModelFromJson(json);

  final int? status;
  final int? code;
  final String? message;
  final Data? data;

  Map<String, dynamic> toJson() =>
      _$MentorReviewsFetchResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    required this.mentors,
    required this.reviews,
  });
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  final Mentors? mentors;
  final Reviews? reviews;

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Mentors {
  Mentors({
    required this.items,
  });
  factory Mentors.fromJson(Map<String, dynamic> json) =>
      _$MentorsFromJson(json);

  final Items? items;

  Map<String, dynamic> toJson() => _$MentorsToJson(this);
}

@JsonSerializable()
class Items {
  Items({
    required this.id,
    required this.name,
    required this.nickname,
    required this.avatar,
    required this.career,
    required this.students,
    required this.courses,
    required this.reviews,
    required this.website,
  });
  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  final String? id;
  final String? name;
  final String? nickname;
  final String? avatar;
  final String? career;
  final int? students;
  final int? courses;
  final int? reviews;
  final String? website;

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}

@JsonSerializable()
class Reviews {
  Reviews({
    required this.items,
  });
  factory Reviews.fromJson(Map<String, dynamic> json) =>
      _$ReviewsFromJson(json);

  final List<Item>? items;

  Map<String, dynamic> toJson() => _$ReviewsToJson(this);
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
