import 'package:json_annotation/json_annotation.dart';

part 'notification_fetch_request_params.g.dart';

@JsonSerializable()
class NotificationFetchRequestParams {
  NotificationFetchRequestParams();

  factory NotificationFetchRequestParams.fromJson(Map<String, dynamic> json) =>
      _$NotificationFetchRequestParamsFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationFetchRequestParamsToJson(this);
}
