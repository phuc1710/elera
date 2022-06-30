import 'package:json_annotation/json_annotation.dart';

import 'faq_section_model.dart';
import 'helper_contact_model.dart';

part 'helper_center_response_model.g.dart';

@JsonSerializable()
class HelperCenterResponseModel {
  HelperCenterResponseModel({this.status, this.data, this.message});

  factory HelperCenterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$HelperCenterResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$HelperCenterResponseModelToJson(this);

  @JsonKey(name: 'status')
  final int? status;

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'data')
  final HelperCenterDataModel? data;
}

@JsonSerializable()
class HelperCenterDataModel {
  HelperCenterDataModel({
    required this.faqs,
    required this.contacts,
  });

  factory HelperCenterDataModel.fromJson(Map<String, dynamic> json) =>
      _$HelperCenterDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$HelperCenterDataModelToJson(this);

  @JsonKey(defaultValue: <FAQSectionModel>[])
  final List<FAQSectionModel?> faqs;
  @JsonKey(defaultValue: <HelperContactModel>[])
  final List<HelperContactModel?> contacts;
}
