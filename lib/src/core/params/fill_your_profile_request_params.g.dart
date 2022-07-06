// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fill_your_profile_request_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FillYourProfileRequestParams _$FillYourProfileRequestParamsFromJson(
  Map<String, dynamic> json,
) =>
    FillYourProfileRequestParams(
      fullName: json['full_name'] as String?,
      nickname: json['nickname'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      gender: json['gender'] as String?,
    );

Map<String, dynamic> _$FillYourProfileRequestParamsToJson(
  FillYourProfileRequestParams instance,
) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'nickname': instance.nickname,
      'date_of_birth': instance.dateOfBirth,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'gender': instance.gender,
    };
