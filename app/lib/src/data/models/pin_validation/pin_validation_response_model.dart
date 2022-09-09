import 'package:json_annotation/json_annotation.dart';

part 'pin_validation_response_model.g.dart';

@JsonSerializable()
class PinValidationResponseModel {
  PinValidationResponseModel({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });
  factory PinValidationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PinValidationResponseModelFromJson(json);

  final int? status;
  final int? code;
  final String? message;
  final Data? data;

  Map<String, dynamic> toJson() => _$PinValidationResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  Data();

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
