import 'package:json_annotation/json_annotation.dart';

part 'course_lessons_fetch_request_params.g.dart';

@JsonSerializable()
class CourseLessonsFetchRequestParams {
  CourseLessonsFetchRequestParams({
    required this.courseId,
  });

  factory CourseLessonsFetchRequestParams.fromJson(Map<String, dynamic> json) =>
      _$CourseLessonsFetchRequestParamsFromJson(json);

  @JsonKey(name: 'course_id')
  final String? courseId;

  Map<String, dynamic> toJson() => _$CourseLessonsFetchRequestParamsToJson(this);
}
