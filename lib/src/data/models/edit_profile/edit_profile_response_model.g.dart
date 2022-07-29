// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditProfileResponseModel _$EditProfileResponseModelFromJson(
        Map<String, dynamic> json) =>
    EditProfileResponseModel(
      status: json['status'] as int?,
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : EditProfileDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EditProfileResponseModelToJson(
        EditProfileResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

EditProfileDataModel _$EditProfileDataModelFromJson(
        Map<String, dynamic> json) =>
    EditProfileDataModel(
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : CountryModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$EditProfileDataModelToJson(
        EditProfileDataModel instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
