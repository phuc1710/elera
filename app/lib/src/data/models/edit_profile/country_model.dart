import 'package:json_annotation/json_annotation.dart';

part 'country_model.g.dart';

@JsonSerializable()
class CountryModel {
  CountryModel({this.id, this.name, this.flag, this.phonePrefix});

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountryModelToJson(this);

  final int? id;
  final String? name;
  final String? flag;
  @JsonKey(name: 'phone_prefix')
  final String? phonePrefix;
}
