import 'package:json_annotation/json_annotation.dart';

part 'profile_response_model.g.dart';

@JsonSerializable()
class ProfileResponseModel {
  ProfileResponseModel({
    this.message,
    this.errorCode,
    this.data,
  });

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseModelToJson(this);

  final String? message;
  @JsonKey(name: 'error_code')
  final int? errorCode;
  final ProfileModel? data;
}

@JsonSerializable()
class ProfileModel {
  ProfileModel({
    this.fullname,
    this.name,
    this.email,
    this.img,
    this.dob,
    this.country,
    this.phone,
    this.gender,
    this.job,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);

  final String? fullname;
  final String? name;
  final String? email;
  final String? img;
  final String? dob;
  final String? country;
  final String? phone;
  final bool? gender;
  final String? job;
}
