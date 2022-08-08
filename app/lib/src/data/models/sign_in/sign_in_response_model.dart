import 'package:json_annotation/json_annotation.dart';

part 'sign_in_response_model.g.dart';

@JsonSerializable()
class SignInResponseModel {
  SignInResponseModel({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignInResponseModelToJson(this);

  final int? status;
  final int? code;
  final String? message;
  final Data? data;

  @override
  String toString() {
    return '$status, $code, $message, $data';
  }
}

@JsonSerializable()
class Data {
  Data({required this.accessToken});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  @JsonKey(name: 'access_token')
  final String? accessToken;

  @override
  String toString() {
    return '$accessToken';
  }
}
