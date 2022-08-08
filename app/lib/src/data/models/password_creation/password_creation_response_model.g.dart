// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_creation_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PasswordCreationResponseModel _$PasswordCreationResponseModelFromJson(
        Map<String, dynamic> json) =>
    PasswordCreationResponseModel(
      errorCode: json['error_code'] as int?,
      data: json['data'] == null
          ? null
          : PasswordCreationModel.fromJson(
              json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$PasswordCreationResponseModelToJson(
        PasswordCreationResponseModel instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'message': instance.message,
      'data': instance.data,
    };

PasswordCreationModel _$PasswordCreationModelFromJson(
        Map<String, dynamic> json) =>
    PasswordCreationModel();

Map<String, dynamic> _$PasswordCreationModelToJson(
        PasswordCreationModel instance) =>
    <String, dynamic>{};
