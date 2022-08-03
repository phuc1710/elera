import 'package:json_annotation/json_annotation.dart';

part 'password_creation_request_params.g.dart';

@JsonSerializable()
class PasswordCreationRequestParams {
  PasswordCreationRequestParams({this.password});

  factory PasswordCreationRequestParams.fromJson(Map<String, dynamic> json) =>
      _$PasswordCreationRequestParamsFromJson(json);

  @JsonKey(name: 'password')
  String? password;

  Map<String, dynamic> toJson() => _$PasswordCreationRequestParamsToJson(this);
}
