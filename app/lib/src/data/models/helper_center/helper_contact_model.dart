import 'package:json_annotation/json_annotation.dart';

part 'helper_contact_model.g.dart';

@JsonSerializable()
class HelperContactModel {
  HelperContactModel({
    required this.id,
    required this.name,
    required this.img,
  });

  factory HelperContactModel.fromJson(Map<String, dynamic> json) =>
      _$HelperContactModelFromJson(json);

  Map<String, dynamic> toJson() => _$HelperContactModelToJson(this);

  final String? id;
  final String? name;
  final String? img;

  @override
  String toString() {
    return '$id, $name, $img';
  }
}
