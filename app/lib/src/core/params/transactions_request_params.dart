import 'package:json_annotation/json_annotation.dart';

part 'transactions_request_params.g.dart';

@JsonSerializable()
class TransactionsRequestParams {
  TransactionsRequestParams();

  factory TransactionsRequestParams.fromJson(Map<String, dynamic> json) =>
      _$TransactionsRequestParamsFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionsRequestParamsToJson(this);
}
