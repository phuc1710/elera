import 'package:json_annotation/json_annotation.dart';

import 'country_model.dart';

part 'edit_profile_response_model.g.dart';

@JsonSerializable()
class EditProfileResponseModel {
  EditProfileResponseModel({
    this.errorCode,
    this.message,
    this.data,
  });

  factory EditProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$EditProfileResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$EditProfileResponseModelToJson(this);
  @JsonKey(name: 'error_code')
  final int? errorCode;
  final String? message;
  final EditProfileDataModel? data;
}

@JsonSerializable()
class EditProfileDataModel {
  EditProfileDataModel({required this.countries});

  factory EditProfileDataModel.fromJson(Map<String, dynamic> json) =>
      _$EditProfileDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$EditProfileDataModelToJson(this);

  @JsonKey(defaultValue: <CountryModel>[])
  final List<CountryModel?> countries;
}
