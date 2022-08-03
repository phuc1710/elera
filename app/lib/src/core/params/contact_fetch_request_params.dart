import 'package:json_annotation/json_annotation.dart';

part 'contact_fetch_request_params.g.dart';

@JsonSerializable()
class ContactFetchRequestParams {
  ContactFetchRequestParams({this.email});

  factory ContactFetchRequestParams.fromJson(Map<String, dynamic> json) =>
      _$ContactFetchRequestParamsFromJson(json);

  @JsonKey(name: 'user_email')
  String? email;

  Map<String, dynamic> toJson() => _$ContactFetchRequestParamsToJson(this);
}
