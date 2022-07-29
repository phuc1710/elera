import 'package:json_annotation/json_annotation.dart';

part 'recent_search_addition_request_params.g.dart';

@JsonSerializable()
class RecentSearchAdditionRequestParams {
  RecentSearchAdditionRequestParams();

  factory RecentSearchAdditionRequestParams.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$RecentSearchAdditionRequestParamsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RecentSearchAdditionRequestParamsToJson(this);
}
