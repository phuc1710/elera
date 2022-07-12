// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deal_fetch_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DealFetchResponseModel _$DealFetchResponseModelFromJson(
        Map<String, dynamic> json) =>
    DealFetchResponseModel(
      message: json['message'] as String?,
      errorCode: json['error_code'] as int?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DealFetchResponseModelToJson(
        DealFetchResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error_code': instance.errorCode,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      deals: (json['deals'] as List<dynamic>?)
          ?.map((e) => Deal.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'deals': instance.deals,
    };

Deal _$DealFromJson(Map<String, dynamic> json) => Deal(
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      description: json['description'] as String?,
      deal: json['deal'] as String?,
    );

Map<String, dynamic> _$DealToJson(Deal instance) => <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'description': instance.description,
      'deal': instance.deal,
    };
