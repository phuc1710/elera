// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_search_addition_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecentSearchAdditionResponseModel _$RecentSearchAdditionResponseModelFromJson(
        Map<String, dynamic> json) =>
    RecentSearchAdditionResponseModel(
      message: json['message'] as String?,
      code: json['code'] as int?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecentSearchAdditionResponseModelToJson(
        RecentSearchAdditionResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data();

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{};
