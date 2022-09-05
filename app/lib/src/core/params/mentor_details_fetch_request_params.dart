import 'package:json_annotation/json_annotation.dart';

part 'mentor_details_fetch_request_params.g.dart';

@JsonSerializable()
class MentorDetailsFetchRequestParams {
  MentorDetailsFetchRequestParams({required this.mentorId, required this.page});

  factory MentorDetailsFetchRequestParams.fromJson(Map<String, dynamic> json) =>
      _$MentorDetailsFetchRequestParamsFromJson(json);

  @JsonKey(name: 'mentor_id')
  final String? mentorId;

  final int? page;

  Map<String, dynamic> toJson() =>
      _$MentorDetailsFetchRequestParamsToJson(this);
}
