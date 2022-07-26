// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileParams _$UpdateProfileParamsFromJson(Map<String, dynamic> json) =>
    UpdateProfileParams(
      fullname: json['fullname'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      dob: json['dob'] as String?,
      country: json['country'] as String?,
      phone: json['phone'] as String?,
      gender: json['gender'] as bool?,
      job: json['job'] as String?,
    );

Map<String, dynamic> _$UpdateProfileParamsToJson(
        UpdateProfileParams instance) =>
    <String, dynamic>{
      'fullname': instance.fullname,
      'name': instance.name,
      'email': instance.email,
      'dob': instance.dob,
      'country': instance.country,
      'phone': instance.phone,
      'gender': instance.gender,
      'job': instance.job,
    };
