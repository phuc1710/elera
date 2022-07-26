import 'package:json_annotation/json_annotation.dart';

part 'fill_your_profile_response_model.g.dart';

@JsonSerializable()
class FillYourProfileResponseModel {
  FillYourProfileResponseModel({this.errorCode, this.data, this.message});

  factory FillYourProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FillYourProfileResponseModelFromJson(json);
  @JsonKey(name: 'error_code')
  int? errorCode;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'data')
  FillYourProfileModel? data;

  Map<String, dynamic> toJson() => _$FillYourProfileResponseModelToJson(this);
}

@JsonSerializable()
class FillYourProfileModel {
  FillYourProfileModel();

  factory FillYourProfileModel.fromJson(Map<String, dynamic> json) =>
      _$FillYourProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$FillYourProfileModelToJson(this);
}
