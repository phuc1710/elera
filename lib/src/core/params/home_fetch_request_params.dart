import 'package:json_annotation/json_annotation.dart';

part 'home_fetch_request_params.g.dart';

@JsonSerializable()
class HomeFetchRequestParams {
  HomeFetchRequestParams();

  factory HomeFetchRequestParams.fromJson(Map<String, dynamic> json) =>
      _$HomeFetchRequestParamsFromJson(json);

  Map<String, dynamic> toJson() => _$HomeFetchRequestParamsToJson(this);
}
