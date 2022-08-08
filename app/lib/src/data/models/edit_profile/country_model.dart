import 'package:json_annotation/json_annotation.dart';

part 'country_model.g.dart';

@JsonSerializable()
class CountryModel {
  CountryModel({
    required this.name,
    required this.dialCode,
    required this.code,
    required this.icon,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountryModelToJson(this);

  final String? name;
  @JsonKey(name: 'dial_code')
  final String? dialCode;
  final String? code;
  final String? icon;
}
