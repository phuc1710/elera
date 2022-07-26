// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_selection_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactSelectionResponseModel _$ContactSelectionResponseModelFromJson(
        Map<String, dynamic> json) =>
    ContactSelectionResponseModel(
      errorCode: json['error_code'] as int?,
      data: json['data'] == null
          ? null
          : ContactSelectionModel.fromJson(
              json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ContactSelectionResponseModelToJson(
        ContactSelectionResponseModel instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'message': instance.message,
      'data': instance.data,
    };

ContactSelectionModel _$ContactSelectionModelFromJson(
        Map<String, dynamic> json) =>
    ContactSelectionModel();

Map<String, dynamic> _$ContactSelectionModelToJson(
        ContactSelectionModel instance) =>
    <String, dynamic>{};
