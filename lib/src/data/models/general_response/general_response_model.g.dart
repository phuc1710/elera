// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneralResponseModel _$GeneralResponseModelFromJson(
        Map<String, dynamic> json) =>
    GeneralResponseModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$GeneralResponseModelToJson(
        GeneralResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
