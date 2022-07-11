import 'package:json_annotation/json_annotation.dart';

part 'pin_entry_request_params.g.dart';

@JsonSerializable()
class PinEntryRequestParams {
  PinEntryRequestParams({this.pinCode});

  factory PinEntryRequestParams.fromJson(Map<String, dynamic> json) =>
      _$PinEntryRequestParamsFromJson(json);

  @JsonKey(name: 'pin_code')
  String? pinCode;

  Map<String, dynamic> toJson() => _$PinEntryRequestParamsToJson(this);
}
