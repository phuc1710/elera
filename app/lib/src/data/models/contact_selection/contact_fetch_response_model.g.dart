// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_fetch_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactFetchResponseModel _$ContactFetchResponseModelFromJson(
        Map<String, dynamic> json) =>
    ContactFetchResponseModel(
      errorCode: json['error_code'] as int?,
      data: json['data'] == null
          ? null
          : ContactListModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ContactFetchResponseModelToJson(
        ContactFetchResponseModel instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'message': instance.message,
      'data': instance.data,
    };

ContactListModel _$ContactListModelFromJson(Map<String, dynamic> json) =>
    ContactListModel(
      (json['contacts'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : ContactModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ContactListModelToJson(ContactListModel instance) =>
    <String, dynamic>{
      'contacts': instance.contactList,
    };

ContactModel _$ContactModelFromJson(Map<String, dynamic> json) => ContactModel(
      type: json['type'] as String?,
      info: json['info'] as String?,
    );

Map<String, dynamic> _$ContactModelToJson(ContactModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'info': instance.info,
    };
