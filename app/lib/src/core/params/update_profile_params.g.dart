// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileParams _$UpdateProfileParamsFromJson(Map<String, dynamic> json) =>
    UpdateProfileParams(
      fullName: json['full_name'] as String?,
      nickname: json['nickname'] as String?,
      email: json['email'] as String?,
      dob: json['dob'] as int?,
      country: json['country'] as String?,
      phone: json['phone'] as String?,
      gender: json['gender'] as String?,
      job: json['job'] as String?,
    );

Map<String, dynamic> _$UpdateProfileParamsToJson(
        UpdateProfileParams instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'nickname': instance.nickname,
      'email': instance.email,
      'dob': instance.dob,
      'country': instance.country,
      'phone': instance.phone,
      'gender': instance.gender,
      'job': instance.job,
    };
