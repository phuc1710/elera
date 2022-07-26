import 'package:json_annotation/json_annotation.dart';

part 'pin_sending_response_model.g.dart';

@JsonSerializable()
class PinSendingResponseModel {
  PinSendingResponseModel({this.errorCode, this.data, this.message});

  factory PinSendingResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PinSendingResponseModelFromJson(json);
  @JsonKey(name: 'error_code')
  int? errorCode;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'data')
  PinSendingModel? data;

  Map<String, dynamic> toJson() => _$PinSendingResponseModelToJson(this);
}

@JsonSerializable()
class PinSendingModel {
  PinSendingModel();

  factory PinSendingModel.fromJson(Map<String, dynamic> json) =>
      _$PinSendingModelFromJson(json);

  Map<String, dynamic> toJson() => _$PinSendingModelToJson(this);
}
