// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_card_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewCardParams _$NewCardParamsFromJson(Map<String, dynamic> json) =>
    NewCardParams(
      cardName: json['card_name'] as String?,
      cardNumber: json['card_number'] as String?,
      expiryDate: json['expiry_date'] as String?,
      cvv: json['cvv'] as String?,
    );

Map<String, dynamic> _$NewCardParamsToJson(NewCardParams instance) =>
    <String, dynamic>{
      'card_name': instance.cardName,
      'card_number': instance.cardNumber,
      'expiry_date': instance.expiryDate,
      'cvv': instance.cvv,
    };
