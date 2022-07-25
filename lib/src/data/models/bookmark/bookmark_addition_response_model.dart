import 'package:json_annotation/json_annotation.dart';

part 'bookmark_addition_response_model.g.dart';

@JsonSerializable()
class BookmarkAdditionResponseModel {
  BookmarkAdditionResponseModel({
    required this.message,
    required this.code,
    required this.data,
  });

  factory BookmarkAdditionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BookmarkAdditionResponseModelFromJson(json);

  final String? message;
  final int? code;
  final Data? data;

  Map<String, dynamic> toJson() => _$BookmarkAdditionResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  Data();

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
