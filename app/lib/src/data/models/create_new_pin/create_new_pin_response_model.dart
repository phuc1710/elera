import 'package:json_annotation/json_annotation.dart';

part 'create_new_pin_response_model.g.dart';

@JsonSerializable()
class CreateNewPinResponseModel {
  CreateNewPinResponseModel({this.errorCode, this.data, this.message});

  factory CreateNewPinResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreateNewPinResponseModelFromJson(json);
  @JsonKey(name: 'error_code')
  int? errorCode;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'data')
  CreateNewPinModel? data;

  Map<String, dynamic> toJson() => _$CreateNewPinResponseModelToJson(this);
}

@JsonSerializable()
class CreateNewPinModel {
  CreateNewPinModel();

  factory CreateNewPinModel.fromJson(Map<String, dynamic> json) =>
      _$CreateNewPinModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateNewPinModelToJson(this);
}
