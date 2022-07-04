// Package imports:
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'general_response_model.g.dart';

@JsonSerializable()
class GeneralResponseModel extends Equatable {
  const GeneralResponseModel({
    this.status,
    this.message,
  });

  factory GeneralResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GeneralResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GeneralResponseModelToJson(this);

  final int? status;
  final String? message;

  @override
  List<Object?> get props => [
        status,
        message,
      ];
}
