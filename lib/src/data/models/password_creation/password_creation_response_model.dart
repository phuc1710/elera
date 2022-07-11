import 'package:json_annotation/json_annotation.dart';

part 'password_creation_response_model.g.dart';

@JsonSerializable()
class PasswordCreationResponseModel {
  PasswordCreationResponseModel({this.errorCode, this.data, this.message});

  factory PasswordCreationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PasswordCreationResponseModelFromJson(json);
  @JsonKey(name: 'error_code')
  int? errorCode;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'data')
  PasswordCreationModel? data;

  Map<String, dynamic> toJson() => _$PasswordCreationResponseModelToJson(this);
}

@JsonSerializable()
class PasswordCreationModel {
  PasswordCreationModel();

  factory PasswordCreationModel.fromJson(Map<String, dynamic> json) =>
      _$PasswordCreationModelFromJson(json);

  Map<String, dynamic> toJson() => _$PasswordCreationModelToJson(this);
}
