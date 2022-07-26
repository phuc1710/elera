import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_profile_params.g.dart';

@JsonSerializable()
class UpdateProfileParams extends Equatable {
  const UpdateProfileParams({
    this.fullname,
    this.name,
    this.email,
    this.dob,
    this.country,
    this.phone,
    this.gender,
    this.job,
  });

  factory UpdateProfileParams.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileParamsFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileParamsToJson(this);

  final String? fullname;
  final String? name;
  final String? email;
  final String? dob;
  final String? country;
  final String? phone;
  final bool? gender;
  final String? job;

  @override
  List<Object?> get props => [
        fullname,
        name,
        email,
        dob,
        country,
        phone,
        gender,
        job,
      ];
}
