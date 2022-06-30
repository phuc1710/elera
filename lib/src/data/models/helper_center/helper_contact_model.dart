import 'package:json_annotation/json_annotation.dart';

part 'helper_contact_model.g.dart';

@JsonSerializable()
class HelperContactModel {
  HelperContactModel({
    this.name,
    this.id,
  });

  factory HelperContactModel.fromJson(Map<String, dynamic> json) =>
      _$HelperContactModelFromJson(json);

  Map<String, dynamic> toJson() => _$HelperContactModelToJson(this);

  final String? name;
  final String? id;
}
