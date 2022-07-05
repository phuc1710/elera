import 'package:json_annotation/json_annotation.dart';

part 'fill_your_profile_response_model.g.dart';

@JsonSerializable()
class FillYourProfileResponseModel {
  FillYourProfileResponseModel({this.status, this.data, this.message});

  factory FillYourProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FillYourProfileResponseModelFromJson(json);
  @JsonKey(name: 'status')
  int? status;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'data')
  FillYourProfileModel? data;

  Map<String, dynamic> toJson() => _$FillYourProfileResponseModelToJson(this);
}

@JsonSerializable()
class FillYourProfileModel {
  FillYourProfileModel({
    this.token,
    this.name,
    this.email,
  });

  factory FillYourProfileModel.fromJson(Map<String, dynamic> json) =>
      _$FillYourProfileModelFromJson(json);
  @JsonKey(name: 'token')
  final String? token;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'email')
  final String? email;

  Map<String, dynamic> toJson() => _$FillYourProfileModelToJson(this);
}
