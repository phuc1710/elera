import 'package:json_annotation/json_annotation.dart';

part 'course_fetch_response_model.g.dart';

@JsonSerializable()
class CourseFetchResponseModel {
  CourseFetchResponseModel({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });

  factory CourseFetchResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CourseFetchResponseModelFromJson(json);

  final int? status;
  final int? code;
  final String? message;
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
    required this.items,
  });

  factory CourseList.fromJson(Map<String, dynamic> json) =>
      _$CourseListFromJson(json);

  final String? tag;
  final List<Item>? items;

  Map<String, dynamic> toJson() => _$CourseListToJson(this);
}

@JsonSerializable()
class Item {
  Item({
    required this.categoryName,
    required this.name,
    required this.image,
    required this.discountPrice,
    required this.originalPrice,
    required this.rating,
    required this.enrollCount,
    required this.isBookmarked,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  @JsonKey(name: 'category_name')
  final String? categoryName;
  final String? name;
  final String? image;

  @JsonKey(name: 'discount_price')
  final String? discountPrice;

  @JsonKey(name: 'original_price')
  final String? originalPrice;
  final double? rating;

  @JsonKey(name: 'enroll_count')
  final String? enrollCount;

  @JsonKey(name: 'is_bookmarked')
  bool? isBookmarked;

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
