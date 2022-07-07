// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'helper_center_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HelperCenterResponseModel _$HelperCenterResponseModelFromJson(
        Map<String, dynamic> json) =>
    HelperCenterResponseModel(
      errorCode: json['error_code'] as int?,
      data: json['data'] == null
          ? null
          : HelperCenterDataModel.fromJson(
              json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$HelperCenterResponseModelToJson(
        HelperCenterResponseModel instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'message': instance.message,
      'data': instance.data,
    };

HelperCenterDataModel _$HelperCenterDataModelFromJson(
        Map<String, dynamic> json) =>
    HelperCenterDataModel(
      faqs: (json['faqs'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : FAQSectionModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      contacts: (json['contacts'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : HelperContactModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$HelperCenterDataModelToJson(
        HelperCenterDataModel instance) =>
    <String, dynamic>{
      'faqs': instance.faqs,
      'contacts': instance.contacts,
    };
