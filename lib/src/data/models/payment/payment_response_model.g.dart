// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentResponseModel _$PaymentResponseModelFromJson(
        Map<String, dynamic> json) =>
    PaymentResponseModel(
      message: json['message'] as String?,
      status: json['status'] as int?,
      data: json['data'] == null
          ? null
          : PaymentDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentResponseModelToJson(
        PaymentResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };

PaymentDataModel _$PaymentDataModelFromJson(Map<String, dynamic> json) =>
    PaymentDataModel(
      payments: (json['payments'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : PaymentModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$PaymentDataModelToJson(PaymentDataModel instance) =>
    <String, dynamic>{
      'payments': instance.payments,
    };

PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) => PaymentModel(
      id: json['id'] as int?,
      displayName: json['display_name'] as String?,
      status: json['status'] as String?,
      img: json['img'] as String?,
    );

Map<String, dynamic> _$PaymentModelToJson(PaymentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'display_name': instance.displayName,
      'status': instance.status,
      'img': instance.img,
    };
