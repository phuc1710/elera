import 'package:json_annotation/json_annotation.dart';

part 'recent_search_removal_request_params.g.dart';

@JsonSerializable()
class RecentSearchRemovalRequestParams {
  RecentSearchRemovalRequestParams();

  factory RecentSearchRemovalRequestParams.fromJson(Map<String, dynamic> json) =>
      _$RecentSearchRemovalRequestParamsFromJson(json);

  Map<String, dynamic> toJson() => _$RecentSearchRemovalRequestParamsToJson(this);
}
