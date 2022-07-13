import 'package:json_annotation/json_annotation.dart';

part 'course_fetch_response_model.g.dart';

@JsonSerializable()
class CourseFetchResponseModel {
  CourseFetchResponseModel({
    required this.message,
    required this.errorCode,
    required this.data,
  });

  factory CourseFetchResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CourseFetchResponseModelFromJson(json);

  final String? message;

  @JsonKey(name: 'error_code')
  final int? errorCode;
  final Data? data;

  Map<String, dynamic> toJson() => _$CourseFetchResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    required this.courseList,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  @JsonKey(name: 'course_list')
  final List<CourseList>? courseList;

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class CourseList {
  CourseList({
    required this.tag,
    required this.courses,
  });

  factory CourseList.fromJson(Map<String, dynamic> json) =>
      _$CourseListFromJson(json);

  final String? tag;
  final List<Course>? courses;

  Map<String, dynamic> toJson() => _$CourseListToJson(this);
}

@JsonSerializable()
class Course {
  Course({
    required this.tag,
    required this.name,
    required this.imagePath,
    required this.price,
    required this.originalPrice,
    required this.rating,
    required this.studentCount,
    required this.isBookmarked,
  });

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  final String? tag;
  final String? name;
  final String? imagePath;
  final String? price;

  @JsonKey(name: 'original_price')
  final String? originalPrice;
  final double? rating;

  @JsonKey(name: 'student_count')
  final String? studentCount;

  @JsonKey(name: 'is_bookmarked')
  bool? isBookmarked;

  Map<String, dynamic> toJson() => _$CourseToJson(this);
}
