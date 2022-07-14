import 'package:json_annotation/json_annotation.dart';

part 'notification_fetch_response_model.g.dart';

@JsonSerializable()
class NotificationFetchResponseModel {
  NotificationFetchResponseModel({
    required this.message,
    required this.errorCode,
    required this.data,
  });

  factory NotificationFetchResponseModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationFetchResponseModelFromJson(json);

  final String? message;

  @JsonKey(name: 'error_code')
  final int? errorCode;
  final Data? data;

  Map<String, dynamic> toJson() => _$NotificationFetchResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    required this.notificationList,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  @JsonKey(name: 'notification_list')
  final List<NotificationList>? notificationList;

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class NotificationList {
  NotificationList({
    required this.date,
    required this.notifications,
  });

  factory NotificationList.fromJson(Map<String, dynamic> json) =>
      _$NotificationListFromJson(json);

  final String? date;
  final List<Notification>? notifications;

  Map<String, dynamic> toJson() => _$NotificationListToJson(this);
}

@JsonSerializable()
class Notification {
  Notification({
    required this.type,
    required this.title,
    required this.description,
  });

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);

  final String? type;
  final String? title;
  final String? description;

  Map<String, dynamic> toJson() => _$NotificationToJson(this);
}
