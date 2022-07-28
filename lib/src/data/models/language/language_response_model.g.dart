// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LanguageModelAdapter extends TypeAdapter<LanguageModel> {
  @override
  final int typeId = 1;

  @override
  LanguageModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LanguageModel(
      id: fields[0] as String?,
      name: fields[1] as String?,
      isSuggested: fields[2] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, LanguageModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.isSuggested);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LanguageModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LanguageResponseModel _$LanguageResponseModelFromJson(
        Map<String, dynamic> json) =>
    LanguageResponseModel(
      status: json['status'] as int?,
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : LanguageDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LanguageResponseModelToJson(
        LanguageResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

LanguageDataModel _$LanguageDataModelFromJson(Map<String, dynamic> json) =>
    LanguageDataModel(
      suggested: (json['suggested'] as List<dynamic>?)
          ?.map((e) => LanguageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => LanguageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LanguageDataModelToJson(LanguageDataModel instance) =>
    <String, dynamic>{
      'suggested': instance.suggested,
      'languages': instance.languages,
    };

LanguageModel _$LanguageModelFromJson(Map<String, dynamic> json) =>
    LanguageModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      isSuggested: json['is_suggested'] as bool?,
    );

Map<String, dynamic> _$LanguageModelToJson(LanguageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'is_suggested': instance.isSuggested,
    };
