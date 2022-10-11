// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_course_detail_fetch_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyCourseDetailFetchResponseModel _$MyCourseDetailFetchResponseModelFromJson(
        Map<String, dynamic> json) =>
    MyCourseDetailFetchResponseModel(
      status: json['status'] as int?,
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyCourseDetailFetchResponseModelToJson(
        MyCourseDetailFetchResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      lessons: json['lessons'] == null
          ? null
          : Lessons.fromJson(json['lessons'] as Map<String, dynamic>),
      certificate: json['certificate'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'lessons': instance.lessons,
      'certificate': instance.certificate,
    };

Lessons _$LessonsFromJson(Map<String, dynamic> json) => Lessons(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
    );

Map<String, dynamic> _$LessonsToJson(Lessons instance) => <String, dynamic>{
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
      currentTime: json['current_time'] as int?,
      content: json['content'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$LessonToJson(Lesson instance) => <String, dynamic>{
      'id': instance.id,
      'section_order': instance.sectionOrder,
      'section_name': instance.sectionName,
      'name': instance.name,
      'order': instance.order,
      'time': instance.time,
      'current_time': instance.currentTime,
      'content': instance.content,
      'status': instance.status,
    };
