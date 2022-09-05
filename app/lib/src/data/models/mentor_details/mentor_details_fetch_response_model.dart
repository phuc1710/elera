import 'package:json_annotation/json_annotation.dart';

import '../course/course_fetch_response_model.dart';

part 'mentor_details_fetch_response_model.g.dart';

@JsonSerializable()
class MentorDetailsFetchResponseModel {
  MentorDetailsFetchResponseModel({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });

  factory MentorDetailsFetchResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MentorDetailsFetchResponseModelFromJson(json);

  final int? status;
  final int? code;
  final String? message;
  final Data? data;

  Map<String, dynamic> toJson() =>
      _$MentorDetailsFetchResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    required this.mentor,
    required this.courses,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  final Mentor? mentor;
  final Courses? courses;

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Courses {
  Courses({
    required this.items,
    required this.isMore,
  });

  factory Courses.fromJson(Map<String, dynamic> json) =>
      _$CoursesFromJson(json);

  final List<Course>? items;

  @JsonKey(name: 'is_more')
  final bool? isMore;

  Map<String, dynamic> toJson() => _$CoursesToJson(this);
}

@JsonSerializable()
class Mentor {
  Mentor({
    required this.items,
  });

  factory Mentor.fromJson(Map<String, dynamic> json) => _$MentorFromJson(json);

  final Items? items;

  Map<String, dynamic> toJson() => _$MentorToJson(this);
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
