import 'package:json_annotation/json_annotation.dart';

part 'deal_fetch_request_params.g.dart';

@JsonSerializable()
class DealFetchRequestParams {
  DealFetchRequestParams();

  factory DealFetchRequestParams.fromJson(Map<String, dynamic> json) =>
      _$DealFetchRequestParamsFromJson(json);

  Map<String, dynamic> toJson() => _$DealFetchRequestParamsToJson(this);
}
