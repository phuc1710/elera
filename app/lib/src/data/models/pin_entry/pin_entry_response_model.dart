import 'package:json_annotation/json_annotation.dart';

part 'pin_entry_response_model.g.dart';

@JsonSerializable()
class PinEntryResponseModel {
  PinEntryResponseModel({this.errorCode, this.data, this.message});

  factory PinEntryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PinEntryResponseModelFromJson(json);
  @JsonKey(name: 'error_code')
  int? errorCode;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'data')
  PinEntryModel? data;

  Map<String, dynamic> toJson() => _$PinEntryResponseModelToJson(this);
}

@JsonSerializable()
class PinEntryModel {
  PinEntryModel();

  factory PinEntryModel.fromJson(Map<String, dynamic> json) =>
      _$PinEntryModelFromJson(json);

  Map<String, dynamic> toJson() => _$PinEntryModelToJson(this);
}
