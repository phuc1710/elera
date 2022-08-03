// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_fetch_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationFetchResponseModel _$NotificationFetchResponseModelFromJson(
        Map<String, dynamic> json) =>
    NotificationFetchResponseModel(
      message: json['message'] as String?,
      errorCode: json['error_code'] as int?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationFetchResponseModelToJson(
        NotificationFetchResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error_code': instance.errorCode,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      notificationList: (json['notification_list'] as List<dynamic>?)
          ?.map((e) => NotificationList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'notification_list': instance.notificationList,
    };

NotificationList _$NotificationListFromJson(Map<String, dynamic> json) =>
    NotificationList(
      date: json['date'] as String?,
      notifications: (json['notifications'] as List<dynamic>?)
          ?.map((e) => Notification.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NotificationListToJson(NotificationList instance) =>
    <String, dynamic>{
      'date': instance.date,
      'notifications': instance.notifications,
    };

Notification _$NotificationFromJson(Map<String, dynamic> json) => Notification(
      type: json['type'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'description': instance.description,
    };
