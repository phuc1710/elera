import 'package:json_annotation/json_annotation.dart';

part 'recent_search_fetch_request_params.g.dart';

@JsonSerializable()
class RecentSearchFetchRequestParams {
  RecentSearchFetchRequestParams(this.userEmail);

  factory RecentSearchFetchRequestParams.fromJson(Map<String, dynamic> json) =>
      _$RecentSearchFetchRequestParamsFromJson(json);

  @JsonKey(name: 'user_email')
  String? userEmail;

  Map<String, dynamic> toJson() => _$RecentSearchFetchRequestParamsToJson(this);
}
