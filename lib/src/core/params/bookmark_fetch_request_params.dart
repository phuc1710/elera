import 'package:json_annotation/json_annotation.dart';

part 'bookmark_fetch_request_params.g.dart';

@JsonSerializable()
class BookmarkFetchRequestParams {
  BookmarkFetchRequestParams();

  factory BookmarkFetchRequestParams.fromJson(Map<String, dynamic> json) =>
      _$BookmarkFetchRequestParamsFromJson(json);

  Map<String, dynamic> toJson() => _$BookmarkFetchRequestParamsToJson(this);
}
