import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'language_response_model.g.dart';

@JsonSerializable()
class LanguageResponseModel extends Equatable {
  const LanguageResponseModel({
    this.message,
    this.status,
    this.data,
  });

  factory LanguageResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LanguageResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageResponseModelToJson(this);

  final String? message;
  final int? status;
  final LanguageDataModel? data;

  @override
  List<Object?> get props => [
        message,
        status,
        data,
      ];
}

@JsonSerializable()
class LanguageDataModel extends Equatable {
  const LanguageDataModel({
    required this.suggested,
    required this.languages,
  });

  factory LanguageDataModel.fromJson(Map<String, dynamic> json) =>
      _$LanguageDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageDataModelToJson(this);

  @JsonKey(defaultValue: <String>[])
  final List<LanguageModel?> suggested;
  @JsonKey(defaultValue: <String>[])
  final List<LanguageModel?> languages;

  @override
  List<Object?> get props => [
        suggested,
        languages,
      ];
}

@JsonSerializable()
class LanguageModel extends Equatable {
  const LanguageModel({this.id, this.name});

  factory LanguageModel.fromJson(Map<String, dynamic> json) =>
      _$LanguageModelFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageModelToJson(this);

  final int? id;
  final String? name;

  @override
  List<Object?> get props => [id, name];
}
