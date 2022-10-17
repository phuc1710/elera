import 'package:json_annotation/json_annotation.dart';

part 'chat_fetch_request_params.g.dart';

@JsonSerializable()
class ChatFetchRequestParams {
  ChatFetchRequestParams();

  factory ChatFetchRequestParams.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ChatFetchRequestParamsFromJson(json);

  Map<String, dynamic> toJson() => _$ChatFetchRequestParamsToJson(this);
}
