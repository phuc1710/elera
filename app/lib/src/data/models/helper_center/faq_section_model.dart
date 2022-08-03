import 'package:json_annotation/json_annotation.dart';

part 'faq_section_model.g.dart';

@JsonSerializable()
class FAQSectionModel {
  FAQSectionModel({
    required this.type,
    required this.items,
  });

  factory FAQSectionModel.fromJson(Map<String, dynamic> json) =>
      _$FAQSectionModelFromJson(json);

  Map<String, dynamic> toJson() => _$FAQSectionModelToJson(this);

  final String? type;
  @JsonKey(defaultValue: <FAQModel>[])
  final List<FAQModel?> items;

  @override
  String toString() {
    return '$type, $items';
  }
}

@JsonSerializable()
class FAQModel {
  FAQModel({
    required this.id,
    required this.title,
    required this.answer,
    required this.type,
  });

  factory FAQModel.fromJson(Map<String, dynamic> json) =>
      _$FAQModelFromJson(json);

  Map<String, dynamic> toJson() => _$FAQModelToJson(this);

  final String? id;
  final String? title;
  final String? answer;
  final String? type;

  @override
  String toString() {
    return '$id, $title, $answer, $type';
  }
}
