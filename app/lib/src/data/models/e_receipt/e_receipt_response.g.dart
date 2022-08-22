// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'e_receipt_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EReceiptResponseModel _$EReceiptResponseModelFromJson(
        Map<String, dynamic> json) =>
    EReceiptResponseModel(
      status: json['status'] as int,
      code: json['code'] as int,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : EReceiptModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EReceiptResponseModelToJson(
        EReceiptResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

EReceiptModel _$EReceiptModelFromJson(Map<String, dynamic> json) =>
    EReceiptModel(
      courseName: json['course_name'] as String,
      courseCategory: json['course_category'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      country: json['country'] as String,
      price: json['price'] as String,
      paymentMethod: json['payment_method'] as String,
      date: json['date'] as String,
      transactionId: json['transaction_id'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$EReceiptModelToJson(EReceiptModel instance) =>
    <String, dynamic>{
      'course_name': instance.courseName,
      'course_category': instance.courseCategory,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'country': instance.country,
      'price': instance.price,
      'payment_method': instance.paymentMethod,
      'date': instance.date,
      'transaction_id': instance.transactionId,
      'status': instance.status,
    };
