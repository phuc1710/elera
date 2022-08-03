import 'package:json_annotation/json_annotation.dart';

part 'payment_response_model.g.dart';

@JsonSerializable()
class PaymentResponseModel {
  PaymentResponseModel({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });

  factory PaymentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentResponseModelToJson(this);

  final int? status;
  final int? code;
  final String? message;
  final PaymentDataModel? data;
}

@JsonSerializable()
class PaymentDataModel {
  PaymentDataModel({
    required this.items,
  });

  factory PaymentDataModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentDataModelToJson(this);

  @JsonKey(defaultValue: <PaymentModel>[])
  final List<PaymentModel?> items;
}

@JsonSerializable()
class PaymentModel {
  PaymentModel({
    required this.id,
    required this.name,
    required this.img,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentModelToJson(this);

  final String? id;
  final String? name;
  final String? img;
}
