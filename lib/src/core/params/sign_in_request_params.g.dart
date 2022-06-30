// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_request_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInRequestParams _$SignInRequestParamsFromJson(Map<String, dynamic> json) =>
    SignInRequestParams(
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$SignInRequestParamsToJson(
  SignInRequestParams instance,
) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
