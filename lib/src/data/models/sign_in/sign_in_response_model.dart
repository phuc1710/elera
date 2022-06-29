import 'package:json_annotation/json_annotation.dart';

part 'sign_in_response_model.g.dart';

@JsonSerializable()
class SignInResponseModel {
  SignInResponseModel({this.status, this.data, this.message});

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseModelFromJson(json);
  @JsonKey(name: 'status')
  int? status;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'data')
  SignInModel? data;

  Map<String, dynamic> toJson() => _$SignInResponseModelToJson(this);
}

@JsonSerializable()
class SignInModel {
  SignInModel({
    this.token,
    this.name,
    this.email,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) =>
      _$SignInModelFromJson(json);
  @JsonKey(name: 'token')
  final String? token;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'email')
  final String? email;

  Map<String, dynamic> toJson() => _$SignInModelToJson(this);
}
