import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request_params.g.dart';

@JsonSerializable()
class SignUpRequestParams {
  SignUpRequestParams({
    this.email,
    this.password,
  });

  factory SignUpRequestParams.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestParamsFromJson(json);

  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: 'password')
  String? password;

  Map<String, dynamic> toJson() => _$SignUpRequestParamsToJson(this);
}
