import 'package:json_annotation/json_annotation.dart';

part 'recent_search_addition_response_model.g.dart';

@JsonSerializable()
class RecentSearchAdditionResponseModel {
  RecentSearchAdditionResponseModel({
    required this.message,
    required this.code,
    required this.data,
  });

  factory RecentSearchAdditionResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$RecentSearchAdditionResponseModelFromJson(json);

  final String? message;
  final int? code;
  final Data? data;

  Map<String, dynamic> toJson() =>
      _$RecentSearchAdditionResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  Data();

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
