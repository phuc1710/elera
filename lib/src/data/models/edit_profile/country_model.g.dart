// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryModel _$CountryModelFromJson(Map<String, dynamic> json) => CountryModel(
      name: json['name'] as String?,
      dialCode: json['dial_code'] as String?,
      code: json['code'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$CountryModelToJson(CountryModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'dial_code': instance.dialCode,
      'code': instance.code,
      'icon': instance.icon,
    };
