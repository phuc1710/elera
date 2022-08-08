// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_entry_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PinEntryResponseModel _$PinEntryResponseModelFromJson(
        Map<String, dynamic> json) =>
    PinEntryResponseModel(
      errorCode: json['error_code'] as int?,
      data: json['data'] == null
          ? null
          : PinEntryModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$PinEntryResponseModelToJson(
        PinEntryResponseModel instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'message': instance.message,
      'data': instance.data,
    };

PinEntryModel _$PinEntryModelFromJson(Map<String, dynamic> json) =>
    PinEntryModel();

Map<String, dynamic> _$PinEntryModelToJson(PinEntryModel instance) =>
    <String, dynamic>{};
