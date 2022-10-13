// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatResponseModel _$ChatResponseModelFromJson(Map<String, dynamic> json) =>
    ChatResponseModel(
      json['status'] as int?,
      json['code'] as int?,
      json['message'] as String?,
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatResponseModelToJson(ChatResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      (json['messages'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'messages': instance.messages,
    };

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      json['id'] as String?,
      json['author'] as String?,
      json['created_at'] as String?,
      json['text'] as String?,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'created_at': instance.createdAt,
      'text': instance.text,
    };
