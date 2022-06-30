// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_section_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FAQSectionModel _$FAQSectionModelFromJson(Map<String, dynamic> json) =>
    FAQSectionModel(
      name: json['name'] as String?,
      items: (json['items'] as List<dynamic>)
          .map((e) =>
              e == null ? null : FAQModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FAQSectionModelToJson(FAQSectionModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'items': instance.items,
    };

FAQModel _$FAQModelFromJson(Map<String, dynamic> json) => FAQModel(
      title: json['title'] as String?,
      answer: json['answer'] as String?,
    );

Map<String, dynamic> _$FAQModelToJson(FAQModel instance) => <String, dynamic>{
      'title': instance.title,
      'answer': instance.answer,
    };
