import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'friend_invite_params.g.dart';

@JsonSerializable()
class FriendInviteParams extends Equatable {
  const FriendInviteParams({this.id});

  factory FriendInviteParams.fromJson(Map<String, dynamic> json) =>
      _$FriendInviteParamsFromJson(json);

  Map<String, dynamic> toJson() => _$FriendInviteParamsToJson(this);

  final String? id;

  @override
  List<Object?> get props => [id];
}
