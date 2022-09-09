// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_validation_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PinValidationResponseModel _$PinValidationResponseModelFromJson(
        Map<String, dynamic> json) =>
    PinValidationResponseModel(
      status: json['status'] as int?,
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PinValidationResponseModelToJson(
        PinValidationResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data();

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{};
