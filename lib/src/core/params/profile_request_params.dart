import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_request_params.g.dart';

@JsonSerializable()
class ProfileRequestParams extends Equatable {
  const ProfileRequestParams({this.id});

  factory ProfileRequestParams.fromJson(Map<String, dynamic> json) =>
      _$ProfileRequestParamsFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileRequestParamsToJson(this);

  final String? id;

  @override
  List<Object?> get props => [id];
}
