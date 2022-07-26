import 'package:json_annotation/json_annotation.dart';

part 'contact_selection_response_model.g.dart';

@JsonSerializable()
class ContactSelectionResponseModel {
  ContactSelectionResponseModel({this.errorCode, this.data, this.message});

  factory ContactSelectionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ContactSelectionResponseModelFromJson(json);
  @JsonKey(name: 'error_code')
  int? errorCode;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'data')
  ContactSelectionModel? data;

  Map<String, dynamic> toJson() => _$ContactSelectionResponseModelToJson(this);
}

@JsonSerializable()
class ContactSelectionModel {
  ContactSelectionModel();

  factory ContactSelectionModel.fromJson(Map<String, dynamic> json) =>
      _$ContactSelectionModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContactSelectionModelToJson(this);
}
