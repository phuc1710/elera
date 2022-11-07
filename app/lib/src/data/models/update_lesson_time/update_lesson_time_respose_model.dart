import 'package:json_annotation/json_annotation.dart';

part 'update_lesson_time_respose_model.g.dart';

@JsonSerializable()
class UpdateLessonTimeResponseModel {
  UpdateLessonTimeResponseModel({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });
  factory UpdateLessonTimeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateLessonTimeResponseModelFromJson(json);

  final int? status;
  final int? code;
  final String? message;
  final Data? data;

  Map<String, dynamic> toJson() => _$UpdateLessonTimeResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  Data();

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
