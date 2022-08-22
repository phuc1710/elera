// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionsResponseModel _$TransactionsResponseModelFromJson(
        Map<String, dynamic> json) =>
    TransactionsResponseModel(
      status: json['status'] as int,
      code: json['code'] as int,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : TransactionsDataModel.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TransactionsResponseModelToJson(
        TransactionsResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

TransactionsDataModel _$TransactionsDataModelFromJson(
        Map<String, dynamic> json) =>
    TransactionsDataModel(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => TransactionsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TransactionsDataModelToJson(
        TransactionsDataModel instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

TransactionsModel _$TransactionsModelFromJson(Map<String, dynamic> json) =>
    TransactionsModel(
      courseName: json['course_name'] as String,
      courseImage: json['course_image'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$TransactionsModelToJson(TransactionsModel instance) =>
    <String, dynamic>{
      'course_name': instance.courseName,
      'course_image': instance.courseImage,
      'status': instance.status,
    };
