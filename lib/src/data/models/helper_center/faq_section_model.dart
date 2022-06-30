import 'package:json_annotation/json_annotation.dart';

part 'faq_section_model.g.dart';

@JsonSerializable()
class FAQSectionModel {
  FAQSectionModel({
    this.name,
    required this.items,
  });

  factory FAQSectionModel.fromJson(Map<String, dynamic> json) =>
      _$FAQSectionModelFromJson(json);

  Map<String, dynamic> toJson() => _$FAQSectionModelToJson(this);

  final String? name;
  final List<FAQModel?> items;
}

@JsonSerializable()
class FAQModel {
  FAQModel({
    this.title,
    this.answer,
  });

  factory FAQModel.fromJson(Map<String, dynamic> json) =>
      _$FAQModelFromJson(json);

  Map<String, dynamic> toJson() => _$FAQModelToJson(this);

  final String? title;
  final String? answer;
}
