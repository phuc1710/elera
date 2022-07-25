import 'package:json_annotation/json_annotation.dart';

part 'recent_search_fetch_response_model.g.dart';

@JsonSerializable()
class RecentSearchFetchResponseModel {
  RecentSearchFetchResponseModel({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });

  factory RecentSearchFetchResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RecentSearchFetchResponseModelFromJson(json);

  final int? status;
  final int? code;
  final String? message;
  final Data? data;

  Map<String, dynamic> toJson() => _$RecentSearchFetchResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    required this.searchList,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  @JsonKey(name: 'search_list')
  final List<String>? searchList;

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
