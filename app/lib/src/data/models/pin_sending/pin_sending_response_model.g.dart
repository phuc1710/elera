// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_sending_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PinSendingResponseModel _$PinSendingResponseModelFromJson(
        Map<String, dynamic> json) =>
    PinSendingResponseModel(
      errorCode: json['error_code'] as int?,
      data: json['data'] == null
          ? null
          : PinSendingModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$PinSendingResponseModelToJson(
        PinSendingResponseModel instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'message': instance.message,
      'data': instance.data,
    };

PinSendingModel _$PinSendingModelFromJson(Map<String, dynamic> json) =>
    PinSendingModel();

Map<String, dynamic> _$PinSendingModelToJson(PinSendingModel instance) =>
    <String, dynamic>{};
