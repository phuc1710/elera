import 'package:json_annotation/json_annotation.dart';

part 'contact_fetch_response_model.g.dart';

@JsonSerializable()
class ContactFetchResponseModel {
  ContactFetchResponseModel({this.errorCode, this.data, this.message});

  factory ContactFetchResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ContactFetchResponseModelFromJson(json);
  @JsonKey(name: 'error_code')
  int? errorCode;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'data')
  ContactListModel? data;

  Map<String, dynamic> toJson() => _$ContactFetchResponseModelToJson(this);
}

@JsonSerializable()
class ContactListModel {
  ContactListModel(this.contactList);

  factory ContactListModel.fromJson(Map<String, dynamic> json) =>
      _$ContactListModelFromJson(json);

  @JsonKey(name: 'contacts', defaultValue: <ContactModel?>[])
  final List<ContactModel?> contactList;

  Map<String, dynamic> toJson() => _$ContactListModelToJson(this);
}

@JsonSerializable()
class ContactModel {
  ContactModel({
    this.type,
    this.info,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) =>
      _$ContactModelFromJson(json);

  @JsonKey(name: 'type')
  final String? type;

  @JsonKey(name: 'info')
  final String? info;

  Map<String, dynamic> toJson() => _$ContactModelToJson(this);
}
