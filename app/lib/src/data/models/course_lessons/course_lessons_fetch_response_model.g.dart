// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_lessons_fetch_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseLessonsFetchResponseModel _$CourseLessonsFetchResponseModelFromJson(
        Map<String, dynamic> json) =>
    CourseLessonsFetchResponseModel(
      status: json['status'] as int?,
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CourseLessonsFetchResponseModelToJson(
        CourseLessonsFetchResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'items': instance.items,
      'total': instance.total,
    };

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      section: json['section'] as String?,
      lesson: (json['lesson'] as List<dynamic>?)
          ?.map((e) => Lesson.fromJson(e as Map<String, dynamic>))
          .toList(),
      time: json['time'] as String?,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'section': instance.section,
      'lesson': instance.lesson,
      'time': instance.time,
    };

Lesson _$LessonFromJson(Map<String, dynamic> json) => Lesson(
      id: json['id'] as String?,
      sectionOrder: json['section_order'] as int?,
      sectionName: json['section_name'] as String?,
      name: json['name'] as String?,
      order: json['order'] as String?,
      time: json['time'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$LessonToJson(Lesson instance) => <String, dynamic>{
      'id': instance.id,
      'section_order': instance.sectionOrder,
      'section_name': instance.sectionName,
      'name': instance.name,
      'order': instance.order,
      'time': instance.time,
      'status': instance.status,
    };
