// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_search_fetch_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecentSearchFetchResponseModel _$RecentSearchFetchResponseModelFromJson(
        Map<String, dynamic> json) =>
    RecentSearchFetchResponseModel(
      status: json['status'] as int?,
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecentSearchFetchResponseModelToJson(
        RecentSearchFetchResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      searchList: (json['search_list'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'search_list': instance.searchList,
    };
