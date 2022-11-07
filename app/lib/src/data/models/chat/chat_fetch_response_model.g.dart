// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_fetch_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatFetchResponseModel _$ChatFetchResponseModelFromJson(
        Map<String, dynamic> json) =>
    ChatFetchResponseModel(
      json['status'] as int?,
      json['code'] as int?,
      json['message'] as String?,
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatFetchResponseModelToJson(
        ChatFetchResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      (json['messages'] as List<dynamic>)
          .map((e) => ChatMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'messages': instance.messages,
    };

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => ChatMessage(
      json['id'] as String?,
      json['author'] as String?,
      json['created_at'] as int?,
      json['text'] as String?,
    );

Map<String, dynamic> _$ChatMessageToJson(ChatMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'created_at': instance.createdAt,
      'text': instance.text,
    };
