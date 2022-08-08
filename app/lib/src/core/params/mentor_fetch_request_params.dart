import 'package:json_annotation/json_annotation.dart';

part 'mentor_fetch_request_params.g.dart';

@JsonSerializable()
class MentorFetchRequestParams {
  MentorFetchRequestParams();

  factory MentorFetchRequestParams.fromJson(Map<String, dynamic> json) =>
      _$MentorFetchRequestParamsFromJson(json);

  Map<String, dynamic> toJson() => _$MentorFetchRequestParamsToJson(this);
}
