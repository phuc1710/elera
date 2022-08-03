import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_profile_params.g.dart';

@JsonSerializable()
class UpdateProfileParams extends Equatable {
  const UpdateProfileParams({
    this.fullName,
    this.nickname,
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

  @JsonKey(name: 'full_name')
  final String? fullName;
  final String? nickname;
  final String? email;
  final int? dob;
  final String? country;
  final String? phone;
  final String? gender;
  final String? job;

  @override
  List<Object?> get props => [
        fullName,
        nickname,
        email,
        dob,
        country,
        phone,
        gender,
        job,
      ];
}
