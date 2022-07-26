import 'package:json_annotation/json_annotation.dart';

part 'course_fetch_request_params.g.dart';

@JsonSerializable()
class CourseFetchRequestParams {
  CourseFetchRequestParams();

  factory CourseFetchRequestParams.fromJson(Map<String, dynamic> json) =>
      _$CourseFetchRequestParamsFromJson(json);

  Map<String, dynamic> toJson() => _$CourseFetchRequestParamsToJson(this);
}
