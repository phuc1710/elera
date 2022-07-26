import 'package:json_annotation/json_annotation.dart';

part 'search_fetch_request_params.g.dart';

@JsonSerializable()
class SearchFetchRequestParams {
  SearchFetchRequestParams(this.searchTerm);

  factory SearchFetchRequestParams.fromJson(Map<String, dynamic> json) =>
      _$SearchFetchRequestParamsFromJson(json);

  @JsonKey(name: 'search_term')
  String? searchTerm;

  Map<String, dynamic> toJson() => _$SearchFetchRequestParamsToJson(this);
}
