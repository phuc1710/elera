import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response_model.g.dart';

@JsonSerializable()
class SignUpResponseModel {
  SignUpResponseModel({this.errorCode, this.data, this.message});

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseModelFromJson(json);
  @JsonKey(name: 'error_code')
  int? errorCode;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'data')
  SignUpModel? data;

  Map<String, dynamic> toJson() => _$SignUpResponseModelToJson(this);
}

@JsonSerializable()
class SignUpModel {
  SignUpModel({
    this.token,
    this.name,
    this.email,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpModelFromJson(json);
  @JsonKey(name: 'token')
  final String? token;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'email')
  final String? email;

  Map<String, dynamic> toJson() => _$SignUpModelToJson(this);
}
