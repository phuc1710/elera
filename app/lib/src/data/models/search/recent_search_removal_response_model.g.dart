// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_search_removal_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecentSearchRemovalResponseModel _$RecentSearchRemovalResponseModelFromJson(
        Map<String, dynamic> json) =>
    RecentSearchRemovalResponseModel(
      message: json['message'] as String?,
      code: json['code'] as int?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecentSearchRemovalResponseModelToJson(
        RecentSearchRemovalResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data();

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{};
