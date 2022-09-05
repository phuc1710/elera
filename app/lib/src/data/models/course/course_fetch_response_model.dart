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
    required this.page,
    required this.isMore,
    required this.categories,
    required this.courses,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  final String? page;

  @JsonKey(name: 'is_more')
  final bool? isMore;
  final List<Category>? categories;
  final List<Course>? courses;

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Category {
  Category({
    required this.id,
    required this.name,
    required this.icon,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  final String? id;
  final String? name;
  final String? icon;

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class Course {
  Course({
    required this.id,
    required this.categoryName,
    required this.name,
    required this.image,
    required this.thumbnail,
    required this.discountPrice,
    required this.originalPrice,
    required this.rating,
    required this.enrollCount,
    required this.isBookmarked,
  });

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  final String? id;

  @JsonKey(name: 'category_name')
  final String? categoryName;
  final String? name;
  final String? image;
  final String? thumbnail;

  @JsonKey(name: 'discount_price')
  final Price? discountPrice;

  @JsonKey(name: 'original_price')
  final Price? originalPrice;
  final double? rating;

  @JsonKey(name: 'enroll_count')
  final int? enrollCount;

  @JsonKey(name: 'is_bookmarked')
  bool? isBookmarked;

  Map<String, dynamic> toJson() => _$CourseToJson(this);
}

@JsonSerializable()
class Price {
  Price({
    required this.vn,
    required this.en,
  });

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);

  final int? vn;
  final int? en;

  Map<String, dynamic> toJson() => _$PriceToJson(this);
}
