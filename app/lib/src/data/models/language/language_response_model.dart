import 'package:ez_cache/ez_cache.dart';
import 'package:json_annotation/json_annotation.dart';

import '../model_type_id.dart';

part 'language_response_model.g.dart';

@JsonSerializable()
class LanguageResponseModel {
  LanguageResponseModel({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });

  factory LanguageResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LanguageResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageResponseModelToJson(this);

  final int? status;
  final int? code;
  final String? message;
  final LanguageDataModel? data;

  @override
  String toString() {
    return '$status, $code, $message, $data';
  }
}

@JsonSerializable()
class LanguageDataModel {
  LanguageDataModel({
    required this.suggested,
    required this.languages,
  });

  factory LanguageDataModel.fromJson(Map<String, dynamic> json) =>
      _$LanguageDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageDataModelToJson(this);

  final List<LanguageModel>? suggested;
  final List<LanguageModel>? languages;

  @override
  String toString() {
    return '$suggested, $languages';
  }
}

@JsonSerializable()
@HiveType(typeId: ModelTypeId.language)
class LanguageModel {
  LanguageModel({
    required this.id,
    required this.name,
    required this.isSuggested,
  });

  factory LanguageModel.fromJson(Map<String, dynamic> json) =>
      _$LanguageModelFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageModelToJson(this);

  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? name;
  @JsonKey(name: 'is_suggested')
  @HiveField(2)
  final bool? isSuggested;

  @override
  String toString() {
    return '$id, $name, $isSuggested';
  }
}
