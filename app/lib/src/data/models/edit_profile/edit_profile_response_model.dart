import 'package:json_annotation/json_annotation.dart';

import 'country_model.dart';

part 'edit_profile_response_model.g.dart';

@JsonSerializable()
class EditProfileResponseModel {
  EditProfileResponseModel({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });

  factory EditProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$EditProfileResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$EditProfileResponseModelToJson(this);

  final int? status;
  final int? code;
  final String? message;
  final EditProfileDataModel? data;
}

@JsonSerializable()
class EditProfileDataModel {
  EditProfileDataModel({
    required this.items,
  });

  factory EditProfileDataModel.fromJson(Map<String, dynamic> json) =>
      _$EditProfileDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$EditProfileDataModelToJson(this);

  @JsonKey(defaultValue: <CountryModel>[])
  final List<CountryModel?> items;
}
