// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fill_your_profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FillYourProfileResponseModel _$FillYourProfileResponseModelFromJson(
        Map<String, dynamic> json) =>
    FillYourProfileResponseModel(
      errorCode: json['error_code'] as int?,
      data: json['data'] == null
          ? null
          : FillYourProfileModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$FillYourProfileResponseModelToJson(
        FillYourProfileResponseModel instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'message': instance.message,
      'data': instance.data,
    };

FillYourProfileModel _$FillYourProfileModelFromJson(
        Map<String, dynamic> json) =>
    FillYourProfileModel(
      token: json['token'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$FillYourProfileModelToJson(
        FillYourProfileModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'name': instance.name,
      'email': instance.email,
    };
