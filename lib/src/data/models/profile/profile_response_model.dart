import 'package:json_annotation/json_annotation.dart';

part 'profile_response_model.g.dart';

@JsonSerializable()
class ProfileResponseModel {
  ProfileResponseModel({
    this.message,
    this.status,
    this.data,
  });

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseModelToJson(this);

  final String? message;
  final int? status;
  final ProfileModel? data;
}

@JsonSerializable()
class ProfileModel {
  ProfileModel({
    this.fullname,
    this.name,
    this.email,
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
  final String? dob;
  final String? country;
  final String? phone;
  final bool? gender;
  final String? job;
}
