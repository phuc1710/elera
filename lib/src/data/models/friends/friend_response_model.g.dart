// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FriendResponseModel _$FriendResponseModelFromJson(Map<String, dynamic> json) =>
    FriendResponseModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : FriendDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FriendResponseModelToJson(
        FriendResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

FriendDataModel _$FriendDataModelFromJson(Map<String, dynamic> json) =>
    FriendDataModel(
      friends: (json['friends'] as List<dynamic>)
          .map((e) => e == null
              ? null
              : FriendModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FriendDataModelToJson(FriendDataModel instance) =>
    <String, dynamic>{
      'friends': instance.friends,
    };

FriendModel _$FriendModelFromJson(Map<String, dynamic> json) => FriendModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      img: json['img'] as String?,
      phone: json['phone'] as String?,
      isInvited: json['is_invited'] as bool? ?? false,
    );

Map<String, dynamic> _$FriendModelToJson(FriendModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'img': instance.img,
      'name': instance.name,
      'phone': instance.phone,
      'is_invited': instance.isInvited,
    };
