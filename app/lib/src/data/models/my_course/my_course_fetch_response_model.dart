import 'package:json_annotation/json_annotation.dart';

part 'my_course_fetch_response_model.g.dart';

@JsonSerializable()
class MyCourseFetchResponseModel {
    MyCourseFetchResponseModel({
        required this.status,
        required this.code,
        required this.message,
        required this.data,
    });

    factory MyCourseFetchResponseModel.fromJson(Map<String, dynamic> json) => _$MyCourseFetchResponseModelFromJson(json);

    final int? status;
    final int? code;
    final String? message;
    final Data? data;

    Map<String, dynamic> toJson() => _$MyCourseFetchResponseModelToJson(this);

}

@JsonSerializable()
class Data {
    Data({
        required this.data,
    });

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

    final List<Datum>? data;

    Map<String, dynamic> toJson() => _$DataToJson(this);

}

@JsonSerializable()
class Datum {
    Datum({
        required this.status,
        required this.courses,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

    final String? status;
    final List<Course>? courses;

    Map<String, dynamic> toJson() => _$DatumToJson(this);

}

@JsonSerializable()
class Course {
    Course({
        required this.courseId,
        required this.status,
        required this.courseInfo,
    });

    factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

    @JsonKey(name: 'course_id') 
    final String? courseId;
    final String? status;

    @JsonKey(name: 'course_info') 
    final CourseInfo? courseInfo;

    Map<String, dynamic> toJson() => _$CourseToJson(this);

}

@JsonSerializable()
class CourseInfo {
    CourseInfo({
        required this.name,
        required this.totalTime,
        required this.lessonCount,
        required this.completeLesson,
    });

    factory CourseInfo.fromJson(Map<String, dynamic> json) => _$CourseInfoFromJson(json);

    final String? name;

    @JsonKey(name: 'total_time') 
    final int? totalTime;

    @JsonKey(name: 'lesson_count') 
    final int? lessonCount;

    @JsonKey(name: 'complete_lesson') 
    final int? completeLesson;

    Map<String, dynamic> toJson() => _$CourseInfoToJson(this);

}
