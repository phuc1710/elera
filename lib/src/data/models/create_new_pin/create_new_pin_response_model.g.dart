// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_new_pin_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateNewPinResponseModel _$CreateNewPinResponseModelFromJson(
  Map<String, dynamic> json,
) =>
    CreateNewPinResponseModel(
      errorCode: json['error_code'] as int?,
      data: json['data'] == null
          ? null
          : CreateNewPinModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CreateNewPinResponseModelToJson(
  CreateNewPinResponseModel instance,
) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'message': instance.message,
      'data': instance.data,
    };

CreateNewPinModel _$CreateNewPinModelFromJson(Map<String, dynamic> json) =>
    CreateNewPinModel(
      token: json['token'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$CreateNewPinModelToJson(CreateNewPinModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'name': instance.name,
      'email': instance.email,
    };
