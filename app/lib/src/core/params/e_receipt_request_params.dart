import 'package:json_annotation/json_annotation.dart';

part 'e_receipt_request_params.g.dart';

@JsonSerializable()
class EReceiptRequestParams {
  EReceiptRequestParams();

  factory EReceiptRequestParams.fromJson(Map<String, dynamic> json) =>
      _$EReceiptRequestParamsFromJson(json);

  Map<String, dynamic> toJson() => _$EReceiptRequestParamsToJson(this);
}
