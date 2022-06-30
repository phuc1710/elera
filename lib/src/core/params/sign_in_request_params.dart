import 'package:json_annotation/json_annotation.dart';

part 'sign_in_request_params.g.dart';

@JsonSerializable()
class SignInRequestParams {
  SignInRequestParams({
    this.email,
    this.password,
  });

  factory SignInRequestParams.fromJson(Map<String, dynamic> json) =>
      _$SignInRequestParamsFromJson(json);

  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: 'password')
  String? password;

  Map<String, dynamic> toJson() => _$SignInRequestParamsToJson(this);
}
