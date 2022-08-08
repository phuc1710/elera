import 'package:json_annotation/json_annotation.dart';

part 'bookmark_addition_request_params.g.dart';

@JsonSerializable()
class BookmarkAdditionRequestParams {
  BookmarkAdditionRequestParams();

  factory BookmarkAdditionRequestParams.fromJson(Map<String, dynamic> json) =>
      _$BookmarkAdditionRequestParamsFromJson(json);

  Map<String, dynamic> toJson() => _$BookmarkAdditionRequestParamsToJson(this);
}
