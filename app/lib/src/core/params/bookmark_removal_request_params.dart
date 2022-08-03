import 'package:json_annotation/json_annotation.dart';

part 'bookmark_removal_request_params.g.dart';

@JsonSerializable()
class BookmarkRemovalRequestParams {
  BookmarkRemovalRequestParams();

  factory BookmarkRemovalRequestParams.fromJson(Map<String, dynamic> json) =>
      _$BookmarkRemovalRequestParamsFromJson(json);

  Map<String, dynamic> toJson() => _$BookmarkRemovalRequestParamsToJson(this);
}
