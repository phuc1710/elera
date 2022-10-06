import 'package:json_annotation/json_annotation.dart';

part 'my_course_detail_fetch_request_params.g.dart';

@JsonSerializable()
class MyCourseDetailFetchRequestParams {
  MyCourseDetailFetchRequestParams(this.courseId);

  factory MyCourseDetailFetchRequestParams.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MyCourseDetailFetchRequestParamsFromJson(json);

  @JsonKey(name: 'course_id')
  final String? courseId;

  Map<String, dynamic> toJson() =>
      _$MyCourseDetailFetchRequestParamsToJson(this);
}
