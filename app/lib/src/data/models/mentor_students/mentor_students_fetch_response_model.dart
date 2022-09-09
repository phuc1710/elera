import 'package:json_annotation/json_annotation.dart';

part 'mentor_students_fetch_response_model.g.dart';
 
@JsonSerializable()
class MentorStudentsFetchResponseModel {
  MentorStudentsFetchResponseModel({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });
  factory MentorStudentsFetchResponseModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MentorStudentsFetchResponseModelFromJson(json);

  final int? status;
  final int? code;
  final String? message;
  final Data? data;

  Map<String, dynamic> toJson() =>
      _$MentorStudentsFetchResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    required this.mentors,
    required this.students,
  });
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  final Mentors? mentors;
  final List<Student>? students;

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Mentors {
  Mentors({
    required this.items,
  });
  factory Mentors.fromJson(Map<String, dynamic> json) =>
      _$MentorsFromJson(json);

  final Items? items;

  Map<String, dynamic> toJson() => _$MentorsToJson(this);
}

@JsonSerializable()
class Items {
  Items({
    required this.id,
    required this.name,
    required this.nickname,
    required this.avatar,
    required this.career,
    required this.students,
    required this.courses,
    required this.reviews,
    required this.website,
  });
  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  final String? id;
  final String? name;
  final String? nickname;
  final String? avatar;
  final String? career;
  final int? students;
  final int? courses;
  final int? reviews;
  final String? website;

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}

@JsonSerializable()
class Student {
  Student({
    required this.id,
    required this.fullName,
    required this.nickname,
    required this.avatar,
  });
  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);

  final String? id;

  @JsonKey(name: 'full_name')
  final String? fullName;
  final String? nickname;
  final String? avatar;

  Map<String, dynamic> toJson() => _$StudentToJson(this);
}
