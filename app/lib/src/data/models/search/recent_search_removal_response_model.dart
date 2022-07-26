import 'package:json_annotation/json_annotation.dart';

part 'recent_search_removal_response_model.g.dart';

@JsonSerializable()
class RecentSearchRemovalResponseModel {
  RecentSearchRemovalResponseModel({
    required this.message,
    required this.code,
    required this.data,
  });

  factory RecentSearchRemovalResponseModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$RecentSearchRemovalResponseModelFromJson(json);

  final String? message;
  final int? code;
  final Data? data;

  Map<String, dynamic> toJson() =>
      _$RecentSearchRemovalResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  Data();

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
