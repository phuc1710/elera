import 'package:json_annotation/json_annotation.dart';

part 'chat_fetch_response_model.g.dart';

@JsonSerializable()
class ChatFetchResponseModel {
  ChatFetchResponseModel(this.status, this.code, this.message, this.data);

  factory ChatFetchResponseModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ChatFetchResponseModelFromJson(json);

  final int? status;
  final int? code;
  final String? message;
  final Data? data;

  Map<String, dynamic> toJson() => _$ChatFetchResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  Data(this.messages);

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  final List<ChatMessage> messages;

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class ChatMessage {
  ChatMessage(this.id, this.author, this.createdAt, this.text);

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);

  final String? id;
  final String? author;

  @JsonKey(name: 'created_at')
  final int? createdAt;
  final String? text;

  Map<String, dynamic> toJson() => _$ChatMessageToJson(this);
}
