import 'package:json_annotation/json_annotation.dart';

part 'bookmark_removal_response_model.g.dart';

@JsonSerializable()
class BookmarkRemovalResponseModel {
  BookmarkRemovalResponseModel({
    required this.message,
    required this.code,
    required this.data,
  });

  factory BookmarkRemovalResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BookmarkRemovalResponseModelFromJson(json);

  final String? message;
  final int? code;
  final Data? data;

  Map<String, dynamic> toJson() => _$BookmarkRemovalResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  Data();

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
