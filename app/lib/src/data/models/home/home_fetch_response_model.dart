import 'package:json_annotation/json_annotation.dart';

import '../course/course_fetch_response_model.dart';

part 'home_fetch_response_model.g.dart';

@JsonSerializable()
class HomeFetchResponseModel {
  HomeFetchResponseModel({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });
  factory HomeFetchResponseModel.fromJson(Map<String, dynamic> json) =>
      _$HomeFetchResponseModelFromJson(json);

  final int? status;
  final int? code;
  final String? message;
  final Data? data;

  Map<String, dynamic> toJson() => _$HomeFetchResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    required this.banners,
    required this.mentors,
    required this.popularCourses,
  });
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  final List<Banner>? banners;
  final List<Mentor>? mentors;

  @JsonKey(name: 'popular_courses')
  final List<Course>? popularCourses;

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Banner {
  Banner({
    required this.id,
    required this.image,
  });
  factory Banner.fromJson(Map<String, dynamic> json) => _$BannerFromJson(json);

  final String? id;
  final String? image;

  Map<String, dynamic> toJson() => _$BannerToJson(this);
}

@JsonSerializable()
class Mentor {
  Mentor({
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
  factory Mentor.fromJson(Map<String, dynamic> json) => _$MentorFromJson(json);

  final String? id;
  final String? name;
  final String? nickname;
  final String? avatar;
  final String? career;
  final int? students;
  final int? courses;
  final int? reviews;
  final String? website;

  Map<String, dynamic> toJson() => _$MentorToJson(this);
}
