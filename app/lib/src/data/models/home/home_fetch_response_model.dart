import 'package:json_annotation/json_annotation.dart';

import '../course/course_fetch_response_model.dart';

part 'home_fetch_response_model.g.dart';

@JsonSerializable()
class HomeFetchResponseModel {
  HomeFetchResponseModel({
    required this.message,
    required this.errorCode,
    required this.data,
  });

  factory HomeFetchResponseModel.fromJson(Map<String, dynamic> json) =>
      _$HomeFetchResponseModelFromJson(json);

  final String? message;

  @JsonKey(name: 'error_code')
  final int? errorCode;
  final Data? data;

  Map<String, dynamic> toJson() => _$HomeFetchResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    required this.deals,
    required this.mentors,
    required this.courseList,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  final List<Deal>? deals;
  final List<Mentor>? mentors;

  @JsonKey(name: 'course_list')
  final List<CourseList>? courseList;

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Deal {
  Deal({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.deal,
  });

  factory Deal.fromJson(Map<String, dynamic> json) => _$DealFromJson(json);

  final String? title;
  final String? subtitle;
  final String? description;
  final String? deal;

  Map<String, dynamic> toJson() => _$DealToJson(this);
}

@JsonSerializable()
class Mentor {
  Mentor({
    required this.nickname,
    required this.fullname,
    required this.description,
    required this.avatar,
  });

  factory Mentor.fromJson(Map<String, dynamic> json) => _$MentorFromJson(json);

  final String? nickname;
  final String? fullname;
  final String? description;
  final String? avatar;

  Map<String, dynamic> toJson() => _$MentorToJson(this);
}
