import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request_params.g.dart';

@JsonSerializable()
class SignUpRequestParams {
  SignUpRequestParams({
    this.email,
    this.password,
    this.loginMethod,
  });

  factory SignUpRequestParams.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestParamsFromJson(json);

  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: 'password')
  String? password;

  @JsonKey(name: 'login_method', defaultValue: 'email')
  String? loginMethod;

  Map<String, dynamic> toJson() => _$SignUpRequestParamsToJson(this);
}
