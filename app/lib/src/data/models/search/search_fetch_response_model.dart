import 'package:json_annotation/json_annotation.dart';

part 'search_fetch_response_model.g.dart';

@JsonSerializable()
class SearchFetchResponseModel {
  SearchFetchResponseModel({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });

  factory SearchFetchResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SearchFetchResponseModelFromJson(json);

  final int? status;
  final int? code;
  final String? message;
  final Data? data;

  Map<String, dynamic> toJson() => _$SearchFetchResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    required this.courses,
    required this.mentors,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  final Courses? courses;
  final Mentors? mentors;

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Courses {
  Courses({
    required this.page,
    required this.total,
    required this.isMore,
    required this.items,
  });

  factory Courses.fromJson(Map<String, dynamic> json) =>
      _$CoursesFromJson(json);

  final int? page;
  final int? total;
  final bool? isMore;
  final List<CoursesItem>? items;

  Map<String, dynamic> toJson() => _$CoursesToJson(this);
}

@JsonSerializable()
class CoursesItem {
  CoursesItem({
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

  factory CoursesItem.fromJson(Map<String, dynamic> json) =>
      _$CoursesItemFromJson(json);

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
  final bool? isBookmarked;

  Map<String, dynamic> toJson() => _$CoursesItemToJson(this);
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

@JsonSerializable()
class Mentors {
  Mentors({
    required this.page,
    required this.total,
    required this.isMore,
    required this.items,
  });

  factory Mentors.fromJson(Map<String, dynamic> json) =>
      _$MentorsFromJson(json);

  final int? page;
  final int? total;
  final bool? isMore;
  final List<MentorsItem>? items;

  Map<String, dynamic> toJson() => _$MentorsToJson(this);
}

@JsonSerializable()
class MentorsItem {
  MentorsItem({
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

  factory MentorsItem.fromJson(Map<String, dynamic> json) =>
      _$MentorsItemFromJson(json);

  final String? id;
  final String? name;
  final String? nickname;
  final String? avatar;
  final String? career;
  final int? students;
  final int? courses;
  final int? reviews;
  final String? website;

  Map<String, dynamic> toJson() => _$MentorsItemToJson(this);
}
