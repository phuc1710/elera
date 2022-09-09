import 'package:json_annotation/json_annotation.dart';

part 'course_reviews_fetch_request_params.g.dart';

@JsonSerializable()
class CourseReviewsFetchRequestParams {
  CourseReviewsFetchRequestParams({
    required this.courseId,
    required this.rate,
    required this.page,
  });

  factory CourseReviewsFetchRequestParams.fromJson(Map<String, dynamic> json) =>
      _$CourseReviewsFetchRequestParamsFromJson(json);

  @JsonKey(name: 'course_id')
  final String? courseId;

  final String? rate;

  final int? page;

  Map<String, dynamic> toJson() => _$CourseReviewsFetchRequestParamsToJson(this);
}
