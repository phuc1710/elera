import 'package:json_annotation/json_annotation.dart';

part 'update_lesson_time_request_params.g.dart';

@JsonSerializable()
class UpdateLessonTimeRequestParams {
  UpdateLessonTimeRequestParams(this.courseId, this.lessonId, this.time);

  factory UpdateLessonTimeRequestParams.fromJson(Map<String, dynamic> json) =>
      _$UpdateLessonTimeRequestParamsFromJson(json);

  @JsonKey(name: 'course_id')
  final String? courseId;

  @JsonKey(name: 'lesson_id')
  final String? lessonId;

  final String? time;

  Map<String, dynamic> toJson() => _$UpdateLessonTimeRequestParamsToJson(this);
}
