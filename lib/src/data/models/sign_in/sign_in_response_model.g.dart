// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInResponseModel _$SignInResponseModelFromJson(Map<String, dynamic> json) =>
    SignInResponseModel(
      errorCode: json['error_code'] as int?,
      data: json['data'] == null
          ? null
          : SignInModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$SignInResponseModelToJson(
  SignInResponseModel instance,
) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'message': instance.message,
      'data': instance.data,
    };

SignInModel _$SignInModelFromJson(Map<String, dynamic> json) => SignInModel(
      token: json['token'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$SignInModelToJson(SignInModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'name': instance.name,
      'email': instance.email,
    };
