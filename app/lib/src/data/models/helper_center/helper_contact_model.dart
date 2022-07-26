import 'package:json_annotation/json_annotation.dart';

part 'helper_contact_model.g.dart';

@JsonSerializable()
class HelperContactModel {
  HelperContactModel({
    this.name,
    this.id,
    this.img,
  });

  factory HelperContactModel.fromJson(Map<String, dynamic> json) =>
      _$HelperContactModelFromJson(json);

  Map<String, dynamic> toJson() => _$HelperContactModelToJson(this);

  final String? name;
  final int? id;
  final String? img;
}
