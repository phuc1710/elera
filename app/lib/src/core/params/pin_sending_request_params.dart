import 'package:json_annotation/json_annotation.dart';

part 'pin_sending_request_params.g.dart';

@JsonSerializable()
class PinSendingRequestParams {
  PinSendingRequestParams({this.contactInfo});

  factory PinSendingRequestParams.fromJson(Map<String, dynamic> json) =>
      _$PinSendingRequestParamsFromJson(json);

  @JsonKey(name: 'contact_info')
  String? contactInfo;

  Map<String, dynamic> toJson() => _$PinSendingRequestParamsToJson(this);
}
