import 'package:json_annotation/json_annotation.dart';

part 'mentor_reviews_fetch_request_params.g.dart';

@JsonSerializable()
class MentorReviewsFetchRequestParams {
  MentorReviewsFetchRequestParams({
    required this.mentorId,
    required this.page,
  });

  factory MentorReviewsFetchRequestParams.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MentorReviewsFetchRequestParamsFromJson(json);

  @JsonKey(name: 'mentor_id')
  final String? mentorId;

  final int? page;

  Map<String, dynamic> toJson() =>
      _$MentorReviewsFetchRequestParamsToJson(this);
}
