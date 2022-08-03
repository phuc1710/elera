import 'package:json_annotation/json_annotation.dart';

part 'profile_response_model.g.dart';

@JsonSerializable()
class ProfileResponseModel {
  ProfileResponseModel({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseModelToJson(this);

  final int? status;
  final int? code;
  final String? message;
  final ProfileModel? data;

  @override
  String toString() {
    return '$status, $code, $message, $data';
  }
}

@JsonSerializable()
class ProfileModel {
  ProfileModel({
    required this.id,
    required this.fullName,
    required this.nickname,
    required this.email,
    required this.phone,
    required this.gender,
    required this.dob,
    required this.avatar,
    required this.country,
    required this.job,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);

  final String? id;
  @JsonKey(name: 'full_name')
  final String? fullName;
  final String? nickname;
  final String? email;
  final String? phone;
  final String? gender;
  final String? dob;
  final String? avatar;
  final String? country;
  final String? job;

  @override
  String toString() {
    return '$id, $fullName, $nickname, $email, $phone, $gender, $dob, $avatar, $country, $job';
  }
}
