import 'package:json_annotation/json_annotation.dart';

part 'inbox_fetch_request_params.g.dart';

@JsonSerializable()
class InboxFetchRequestParams {
  InboxFetchRequestParams();

  factory InboxFetchRequestParams.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$InboxFetchRequestParamsFromJson(json);

  Map<String, dynamic> toJson() => _$InboxFetchRequestParamsToJson(this);
}
