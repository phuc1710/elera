// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inbox_fetch_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InboxFetchResponseModel _$InboxFetchResponseModelFromJson(
        Map<String, dynamic> json) =>
    InboxFetchResponseModel(
      status: json['status'] as int?,
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InboxFetchResponseModelToJson(
        InboxFetchResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      chats: (json['chats'] as List<dynamic>?)
          ?.map((e) => Chat.fromJson(e as Map<String, dynamic>))
          .toList(),
      calls: (json['calls'] as List<dynamic>?)
          ?.map((e) => Call.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'chats': instance.chats,
      'calls': instance.calls,
    };

Call _$CallFromJson(Map<String, dynamic> json) => Call(
      id: json['id'] as String?,
      avatar: json['avatar'] as String?,
      name: json['name'] as String?,
      lastCallType: json['last_call_type'] as String?,
      lastCallTime: json['last_call_time'] as String?,
    );

Map<String, dynamic> _$CallToJson(Call instance) => <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avatar,
      'name': instance.name,
      'last_call_type': instance.lastCallType,
      'last_call_time': instance.lastCallTime,
    };

Chat _$ChatFromJson(Map<String, dynamic> json) => Chat(
      id: json['id'] as String?,
      avatar: json['avatar'] as String?,
      name: json['name'] as String?,
      unreadMessages: json['unread_messages'] as int?,
      lastMessage: json['last_message'] as String?,
      lastMessageTime: json['last_message_time'] as String?,
    );

Map<String, dynamic> _$ChatToJson(Chat instance) => <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avatar,
      'name': instance.name,
      'unread_messages': instance.unreadMessages,
      'last_message': instance.lastMessage,
      'last_message_time': instance.lastMessageTime,
    };
