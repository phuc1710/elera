// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LanguageResponseModel _$LanguageResponseModelFromJson(
        Map<String, dynamic> json) =>
    LanguageResponseModel(
      message: json['message'] as String?,
      status: json['status'] as int?,
      data: json['data'] == null
          ? null
          : LanguageDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LanguageResponseModelToJson(
        LanguageResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };

LanguageDataModel _$LanguageDataModelFromJson(Map<String, dynamic> json) =>
    LanguageDataModel(
      suggested: (json['suggested'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : LanguageModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      languages: (json['languages'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : LanguageModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$LanguageDataModelToJson(LanguageDataModel instance) =>
    <String, dynamic>{
      'suggested': instance.suggested,
      'languages': instance.languages,
    };

LanguageModel _$LanguageModelFromJson(Map<String, dynamic> json) =>
    LanguageModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$LanguageModelToJson(LanguageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
