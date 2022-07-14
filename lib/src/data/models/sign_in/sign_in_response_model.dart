import 'package:json_annotation/json_annotation.dart';

part 'sign_in_response_model.g.dart';

@JsonSerializable()
class SignInResponseModel {
  SignInResponseModel({
    required this.status,
    required this.errorCode,
    required this.message,
    required this.data,
  });

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseModelFromJson(json);

  final int? status;
  final int? errorCode;
  final String? message;
  final Data? data;

  Map<String, dynamic> toJson() => _$SignInResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  final String? token;

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
