// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_fetch_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchFetchResponseModel _$SearchFetchResponseModelFromJson(
        Map<String, dynamic> json) =>
    SearchFetchResponseModel(
      status: json['status'] as int?,
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchFetchResponseModelToJson(
        SearchFetchResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      mentors: (json['mentors'] as List<dynamic>?)
          ?.map((e) => Mentor.fromJson(e as Map<String, dynamic>))
          .toList(),
      courses: (json['courses'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'mentors': instance.mentors,
      'courses': instance.courses,
    };
