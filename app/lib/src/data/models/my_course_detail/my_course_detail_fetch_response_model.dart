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

  final List<Item>? items;
  final int? total;

  Map<String, dynamic> toJson() => _$LessonsToJson(this);
}

@JsonSerializable()
class Item {
  Item({
    required this.section,
    required this.lesson,
    required this.time,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  final String? section;
  final List<Lesson>? lesson;
  final String? time;

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

@JsonSerializable()
class Lesson {
  Lesson({
    required this.id,
    required this.sectionOrder,
    required this.sectionName,
    required this.name,
    required this.order,
    required this.time,
    required this.currentTime,
    required this.content,
    required this.status,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);

  final String? id;

  @JsonKey(name: 'section_order')
  final int? sectionOrder;

  @JsonKey(name: 'section_name')
  final String? sectionName;
  final String? name;
  final String? order;
  final String? time;

  @JsonKey(name: 'current_time')
  final int? currentTime;
  final String? content;
  final String? status;

  Map<String, dynamic> toJson() => _$LessonToJson(this);
}
