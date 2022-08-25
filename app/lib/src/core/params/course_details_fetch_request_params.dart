import 'package:json_annotation/json_annotation.dart';

part 'course_details_fetch_request_params.g.dart';

@JsonSerializable()
class CourseDetailsFetchRequestParams {
  CourseDetailsFetchRequestParams({
    required this.courseId,
  });

  factory CourseDetailsFetchRequestParams.fromJson(Map<String, dynamic> json) =>
      _$CourseDetailsFetchRequestParamsFromJson(json);

  @JsonKey(name: 'course_id')
  final String? courseId;

  Map<String, dynamic> toJson() => _$CourseDetailsFetchRequestParamsToJson(this);
}
