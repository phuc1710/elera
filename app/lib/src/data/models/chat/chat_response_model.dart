import 'package:json_annotation/json_annotation.dart';

part '../chat/chat_response_model.g.dart';

@JsonSerializable()
class ChatResponseModel {
  ChatResponseModel(this.status, this.code, this.message, this.data);

  factory ChatResponseModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ChatResponseModelFromJson(json);

  final int? status;
  final int? code;
  final String? message;
  final Data? data;

  Map<String, dynamic> toJson() => _$ChatResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  Data(this.messages);

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  final List<Message> messages;

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Message {
  Message(this.id, this.author, this.createdAt, this.text);

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  final String? id;
  final String? author;

  @JsonKey(name: 'created_at')
  final String? createdAt;
  final String? text;

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
