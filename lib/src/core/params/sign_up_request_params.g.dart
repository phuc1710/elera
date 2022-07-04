// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequestParams _$SignUpRequestParamsFromJson(Map<String, dynamic> json) =>
    SignUpRequestParams(
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$SignUpRequestParamsToJson(
  SignUpRequestParams instance,
) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
