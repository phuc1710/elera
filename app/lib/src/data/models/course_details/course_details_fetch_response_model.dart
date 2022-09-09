import 'package:json_annotation/json_annotation.dart';

part 'course_details_fetch_response_model.g.dart';

@JsonSerializable()
class CourseDetailsFetchResponseModel {
  CourseDetailsFetchResponseModel({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });
  factory CourseDetailsFetchResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CourseDetailsFetchResponseModelFromJson(json);

  final int? status;
  final int? code;
  final String? message;
  final Data? data;

  Map<String, dynamic> toJson() =>
      _$CourseDetailsFetchResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  Data({
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
    required this.totalTime,
    required this.aboutCourse,
    required this.mentor,
    required this.tools,
    required this.reviewCount,
  });
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

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

  @JsonKey(name: 'total_time')
  final int? totalTime;

  @JsonKey(name: 'about_course')
  final String? aboutCourse;
  final Mentor? mentor;
  final List<Tool>? tools;

  @JsonKey(name: 'review_count')
  final int? reviewCount;

  Map<String, dynamic> toJson() => _$DataToJson(this);
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
class Mentor {
  Mentor({
    required this.id,
    required this.name,
    required this.avatar,
    required this.career,
  });
  factory Mentor.fromJson(Map<String, dynamic> json) => _$MentorFromJson(json);

  final String? id;
  final String? name;
  final String? avatar;
  final String? career;

  Map<String, dynamic> toJson() => _$MentorToJson(this);
}

@JsonSerializable()
class Tool {
  Tool({
    required this.icon,
    required this.name,
  });
  factory Tool.fromJson(Map<String, dynamic> json) => _$ToolFromJson(json);

  final String? icon;
  final String? name;

  Map<String, dynamic> toJson() => _$ToolToJson(this);
}
