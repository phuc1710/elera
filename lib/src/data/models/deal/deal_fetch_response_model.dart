import 'package:json_annotation/json_annotation.dart';

part 'deal_fetch_response_model.g.dart';

@JsonSerializable()
class DealFetchResponseModel {
  DealFetchResponseModel({
    required this.message,
    required this.errorCode,
    required this.data,
  });

  factory DealFetchResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DealFetchResponseModelFromJson(json);

  final String? message;

  @JsonKey(name: 'error_code')
  final int? errorCode;
  final Data? data;

  Map<String, dynamic> toJson() => _$DealFetchResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    required this.deals,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  final List<Deal>? deals;

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Deal {
  Deal({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.deal,
  });

  factory Deal.fromJson(Map<String, dynamic> json) => _$DealFromJson(json);

  final String? title;
  final String? subtitle;
  final String? description;
  final String? deal;

  Map<String, dynamic> toJson() => _$DealToJson(this);
}
