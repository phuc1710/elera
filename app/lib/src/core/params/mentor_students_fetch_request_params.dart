import 'package:json_annotation/json_annotation.dart';

part 'mentor_students_fetch_request_params.g.dart';

@JsonSerializable()
class MentorStudentsFetchRequestParams {
  MentorStudentsFetchRequestParams({
    required this.mentorId,
  });

  factory MentorStudentsFetchRequestParams.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MentorStudentsFetchRequestParamsFromJson(json);

  @JsonKey(name: 'mentor_id')
  final String? mentorId;

  Map<String, dynamic> toJson() =>
      _$MentorStudentsFetchRequestParamsToJson(this);
}
