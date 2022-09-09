import 'package:json_annotation/json_annotation.dart';

part 'mentor_courses_fetch_request_params.g.dart';

@JsonSerializable()
class MentorCoursesFetchRequestParams {
  MentorCoursesFetchRequestParams({
    required this.mentorId,
    required this.page,
  });

  factory MentorCoursesFetchRequestParams.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MentorCoursesFetchRequestParamsFromJson(json);

  @JsonKey(name: 'mentor_id')
  final String? mentorId;

  final int? page;

  Map<String, dynamic> toJson() =>
      _$MentorCoursesFetchRequestParamsToJson(this);
}
