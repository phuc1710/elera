import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_response_model.g.dart';

@JsonSerializable()
class PaymentResponseModel extends Equatable {
  const PaymentResponseModel({
    this.message,
    this.status,
    this.data,
  });

  factory PaymentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentResponseModelToJson(this);

  final String? message;
  final int? status;
  final PaymentDataModel? data;

  @override
  List<Object?> get props => [
        message,
        status,
        data,
      ];
}

@JsonSerializable()
class PaymentDataModel extends Equatable {
  const PaymentDataModel({
    required this.payments,
  });

  factory PaymentDataModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentDataModelToJson(this);

  @JsonKey(defaultValue: <PaymentModel>[])
  final List<PaymentModel?> payments;

  @override
  List<Object?> get props => [payments];
}

@JsonSerializable()
class PaymentModel extends Equatable {
  const PaymentModel({
    this.id,
    this.displayName,
    this.status,
    this.img,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentModelToJson(this);

  final int? id;
  @JsonKey(name: 'display_name')
  final String? displayName;
  final String? status;
  final String? img;

  @override
  List<Object?> get props => [
        id,
        displayName,
        status,
        img,
      ];
}
