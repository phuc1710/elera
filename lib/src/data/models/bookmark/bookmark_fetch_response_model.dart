import 'package:json_annotation/json_annotation.dart';

import '../course/course_fetch_response_model.dart';

part 'bookmark_fetch_response_model.g.dart';

@JsonSerializable()
class BookmarkFetchResponseModel {
  BookmarkFetchResponseModel({
    required this.message,
    required this.code,
    required this.data,
  });

  factory BookmarkFetchResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BookmarkFetchResponseModelFromJson(json);

  final String? message;
  final int? code;
  final Data? data;

  Map<String, dynamic> toJson() => _$BookmarkFetchResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    required this.bookmarkCourses,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  @JsonKey(name: 'bookmark_courses')
  final List<CourseList>? bookmarkCourses;

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
