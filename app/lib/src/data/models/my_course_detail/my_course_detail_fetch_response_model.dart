import 'package:json_annotation/json_annotation.dart';

part 'my_course_detail_fetch_response_model.g.dart';

@JsonSerializable()
class MyCourseDetailFetchResponseModel {
  MyCourseDetailFetchResponseModel({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });
  factory MyCourseDetailFetchResponseModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MyCourseDetailFetchResponseModelFromJson(json);

  final int? status;
  final int? code;
  final String? message;
  final Data? data;

  Map<String, dynamic> toJson() =>
      _$MyCourseDetailFetchResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    required this.lessons,
    required this.certificate,
  });
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  final Lessons? lessons;
  final String? certificate;

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Lessons {
  Lessons({
    required this.items,
    required this.total,
  });
  factory Lessons.fromJson(Map<String, dynamic> json) =>
      _$LessonsFromJson(json);

  final List<ItemElement>? items;
  final int? total;

  Map<String, dynamic> toJson() => _$LessonsToJson(this);
}

@JsonSerializable()
class ItemElement {
  ItemElement({
    required this.section,
    required this.lesson,
    required this.time,
  });
  factory ItemElement.fromJson(Map<String, dynamic> json) =>
      _$ItemElementFromJson(json);

  final String? section;
  final List<Lesson>? lesson;
  final String? time;

  Map<String, dynamic> toJson() => _$ItemElementToJson(this);
}

@JsonSerializable()
class Lesson {
  Lesson({
    required this.item,
  });
  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);

  final LessonItem? item;

  Map<String, dynamic> toJson() => _$LessonToJson(this);
}

@JsonSerializable()
class LessonItem {
  LessonItem({
    required this.id,
    required this.courseId,
    required this.sectionOrder,
    required this.sectionName,
    required this.lessonOrder,
    required this.lessonName,
    required this.time,
    required this.content,
    required this.status,
  });
  factory LessonItem.fromJson(Map<String, dynamic> json) =>
      _$LessonItemFromJson(json);

  @JsonKey(name: '_id')
  final String? id;

  @JsonKey(name: 'course_id')
  final String? courseId;

  @JsonKey(name: 'section_order')
  final int? sectionOrder;

  @JsonKey(name: 'section_name')
  final String? sectionName;

  @JsonKey(name: 'lesson_order')
  final int? lessonOrder;

  @JsonKey(name: 'lesson_name')
  final String? lessonName;
  final int? time;
  final String? content;
  final String? status;

  Map<String, dynamic> toJson() => _$LessonItemToJson(this);
}
