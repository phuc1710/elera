// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'create_new_pin_request_params.g.dart';

@JsonSerializable()
class CreateNewPinRequestParams {
  CreateNewPinRequestParams({this.pinCode});

  factory CreateNewPinRequestParams.fromJson(Map<String, dynamic> json) =>
      _$CreateNewPinRequestParamsFromJson(json);

  @JsonKey(name: 'pin_code')
  String? pinCode;

  Map<String, dynamic> toJson() => _$CreateNewPinRequestParamsToJson(this);
}
