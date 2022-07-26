import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'new_card_params.g.dart';

@JsonSerializable()
class NewCardParams extends Equatable {
  const NewCardParams({
    this.cardName,
    this.cardNumber,
    this.expiryDate,
    this.cvv,
  });

  factory NewCardParams.fromJson(Map<String, dynamic> json) =>
      _$NewCardParamsFromJson(json);

  Map<String, dynamic> toJson() => _$NewCardParamsToJson(this);

  @JsonKey(name: 'card_name')
  final String? cardName;
  @JsonKey(name: 'card_number')
  final String? cardNumber;
  @JsonKey(name: 'expiry_date')
  final String? expiryDate;
  final String? cvv;

  @override
  List<Object?> get props => [
        cardName,
        cardNumber,
        expiryDate,
        cvv,
      ];
}
