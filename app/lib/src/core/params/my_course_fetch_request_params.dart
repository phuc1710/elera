import 'package:json_annotation/json_annotation.dart';

part 'my_course_fetch_request_params.g.dart';

@JsonSerializable()
class MyCourseFetchRequestParams {
  MyCourseFetchRequestParams();

  factory MyCourseFetchRequestParams.fromJson(Map<String, dynamic> json) =>
      _$MyCourseFetchRequestParamsFromJson(json);

  Map<String, dynamic> toJson() => _$MyCourseFetchRequestParamsToJson(this);
}
