import 'package:json_annotation/json_annotation.dart';

part 'inbox_fetch_response_model.g.dart';

@JsonSerializable()
class InboxFetchResponseModel {
  InboxFetchResponseModel({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });

  factory InboxFetchResponseModel.fromJson(Map<String, dynamic> json) =>
      _$InboxFetchResponseModelFromJson(json);

  final int? status;
  final int? code;
  final String? message;
  final Data? data;

  Map<String, dynamic> toJson() => _$InboxFetchResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    required this.chats,
    required this.calls,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  final List<Chat>? chats;
  final List<Call>? calls;

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Call {
  Call({
    required this.id,
    required this.avatar,
    required this.name,
    required this.lastCallType,
    required this.lastCallTime,
  });

  factory Call.fromJson(Map<String, dynamic> json) => _$CallFromJson(json);

  final String? id;
  final String? avatar;
  final String? name;

  @JsonKey(name: 'last_call_type')
  final String? lastCallType;

  @JsonKey(name: 'last_call_time')
  final String? lastCallTime;

  Map<String, dynamic> toJson() => _$CallToJson(this);
}

@JsonSerializable()
class Chat {
  Chat({
    required this.id,
    required this.avatar,
    required this.name,
    required this.unreadMessages,
    required this.lastMessage,
    required this.lastMessageTime,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);

  final String? id;
  final String? avatar;
  final String? name;

  @JsonKey(name: 'unread_messages')
  final int? unreadMessages;

  @JsonKey(name: 'last_message')
  final String? lastMessage;

  @JsonKey(name: 'last_message_time')
  final String? lastMessageTime;

  Map<String, dynamic> toJson() => _$ChatToJson(this);
}
