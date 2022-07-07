import 'package:json_annotation/json_annotation.dart';

part 'contact_selection_request_params.g.dart';

@JsonSerializable()
class ContactSelectionRequestParams {
  ContactSelectionRequestParams({this.contactInfo});

  factory ContactSelectionRequestParams.fromJson(Map<String, dynamic> json) =>
      _$ContactSelectionRequestParamsFromJson(json);

  @JsonKey(name: 'contact_info')
  String? contactInfo;

  Map<String, dynamic> toJson() => _$ContactSelectionRequestParamsToJson(this);
}
