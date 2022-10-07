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
          ?.map((e) => ItemElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
    );

Map<String, dynamic> _$LessonsToJson(Lessons instance) => <String, dynamic>{
      'items': instance.items,
      'total': instance.total,
    };

ItemElement _$ItemElementFromJson(Map<String, dynamic> json) => ItemElement(
      section: json['section'] as String?,
      lesson: (json['lesson'] as List<dynamic>?)
          ?.map((e) => Lesson.fromJson(e as Map<String, dynamic>))
          .toList(),
      time: json['time'] as String?,
    );

Map<String, dynamic> _$ItemElementToJson(ItemElement instance) =>
    <String, dynamic>{
      'section': instance.section,
      'lesson': instance.lesson,
      'time': instance.time,
    };

Lesson _$LessonFromJson(Map<String, dynamic> json) => Lesson(
      item: json['item'] == null
          ? null
          : LessonItem.fromJson(json['item'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LessonToJson(Lesson instance) => <String, dynamic>{
      'item': instance.item,
    };

LessonItem _$LessonItemFromJson(Map<String, dynamic> json) => LessonItem(
      id: json['_id'] as String?,
      courseId: json['course_id'] as String?,
      sectionOrder: json['section_order'] as int?,
      sectionName: json['section_name'] as String?,
      lessonOrder: json['lesson_order'] as int?,
      lessonName: json['lesson_name'] as String?,
      time: json['time'] as int?,
      content: json['content'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$LessonItemToJson(LessonItem instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'course_id': instance.courseId,
      'section_order': instance.sectionOrder,
      'section_name': instance.sectionName,
      'lesson_order': instance.lessonOrder,
      'lesson_name': instance.lessonName,
      'time': instance.time,
      'content': instance.content,
      'status': instance.status,
    };
