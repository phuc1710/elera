import 'package:json_annotation/json_annotation.dart';

part 'create_new_pin_response_model.g.dart';

@JsonSerializable()
class CreateNewPinResponseModel {
  CreateNewPinResponseModel({this.status, this.data, this.message});

  factory CreateNewPinResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreateNewPinResponseModelFromJson(json);
  @JsonKey(name: 'status')
  int? status;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'data')
  CreateNewPinModel? data;

  Map<String, dynamic> toJson() => _$CreateNewPinResponseModelToJson(this);
}

@JsonSerializable()
class CreateNewPinModel {
  CreateNewPinModel({
    this.token,
    this.name,
    this.email,
  });

  factory CreateNewPinModel.fromJson(Map<String, dynamic> json) =>
      _$CreateNewPinModelFromJson(json);
  @JsonKey(name: 'token')
  final String? token;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'email')
  final String? email;

  Map<String, dynamic> toJson() => _$CreateNewPinModelToJson(this);
}
