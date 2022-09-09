import 'package:json_annotation/json_annotation.dart';

part 'pin_validation_request_params.g.dart';

@JsonSerializable()
class PinValidationRequestParams {
  PinValidationRequestParams({this.pin});

  factory PinValidationRequestParams.fromJson(Map<String, dynamic> json) =>
      _$PinValidationRequestParamsFromJson(json);

  String? pin;

  Map<String, dynamic> toJson() => _$PinValidationRequestParamsToJson(this);
}
