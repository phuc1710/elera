// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'fill_your_profile_request_params.g.dart';

@JsonSerializable()
class FillYourProfileRequestParams {
  FillYourProfileRequestParams({
    this.fullName,
    this.nickname,
    this.dateOfBirth,
    this.email,
    this.phoneNumber,
    this.gender,
  });

  factory FillYourProfileRequestParams.fromJson(Map<String, dynamic> json) =>
      _$FillYourProfileRequestParamsFromJson(json);

  @JsonKey(name: 'full_name')
  String? fullName;

  @JsonKey(name: 'nickname')
  String? nickname;

  @JsonKey(name: 'date_of_birth')
  String? dateOfBirth;

  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: 'phone_number')
  String? phoneNumber;

  @JsonKey(name: 'gender')
  String? gender;

  Map<String, dynamic> toJson() => _$FillYourProfileRequestParamsToJson(this);
}
