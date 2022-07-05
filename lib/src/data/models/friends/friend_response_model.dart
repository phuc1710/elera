import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'friend_response_model.g.dart';

@JsonSerializable()
class FriendResponseModel extends Equatable {
  const FriendResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory FriendResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FriendResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$FriendResponseModelToJson(this);

  final int? status;
  final String? message;
  final FriendDataModel? data;

  @override
  List<Object?> get props => [
        status,
        message,
        data,
      ];
}

@JsonSerializable()
class FriendDataModel extends Equatable {
  const FriendDataModel({required this.friends});

  factory FriendDataModel.fromJson(Map<String, dynamic> json) =>
      _$FriendDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$FriendDataModelToJson(this);

  final List<FriendModel?> friends;

  @override
  List<Object?> get props => [friends];
}

@JsonSerializable()
class FriendModel {
  FriendModel({
    this.id,
    this.name,
    this.img,
    this.phone,
    required this.isInvited,
  });

  factory FriendModel.fromJson(Map<String, dynamic> json) =>
      _$FriendModelFromJson(json);

  Map<String, dynamic> toJson() => _$FriendModelToJson(this);

  String? id;
  String? img;
  String? name;
  String? phone;
  @JsonKey(name: 'is_invited', defaultValue: false)
  bool isInvited;
}
