import 'package:json_annotation/json_annotation.dart';

import '../course/course_fetch_response_model.dart';
import '../mentor/mentor_fetch_response_model.dart';

part 'search_fetch_response_model.g.dart';

@JsonSerializable()
class SearchFetchResponseModel {
  SearchFetchResponseModel({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });

  factory SearchFetchResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SearchFetchResponseModelFromJson(json);

  final int? status;
  final int? code;
  final String? message;
  final Data? data;

  Map<String, dynamic> toJson() => _$SearchFetchResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    required this.mentors,
    required this.courses,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  final List<Mentor>? mentors;
  final List<Course>? courses;

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
