import 'package:json_annotation/json_annotation.dart';

part 'mentor_fetch_response_model.g.dart';

@JsonSerializable()
class MentorFetchResponseModel {
  MentorFetchResponseModel({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });

  factory MentorFetchResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MentorFetchResponseModelFromJson(json);

  final int? status;
  final int? code;
  final String? message;
  final Data? data;

  Map<String, dynamic> toJson() => _$MentorFetchResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    required this.mentors,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  final List<Mentor>? mentors;

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Mentor {
  Mentor({
    required this.name,
    required this.description,
    required this.avatar,
  });

  factory Mentor.fromJson(Map<String, dynamic> json) => _$MentorFromJson(json);

  final String? name;
  final String? description;
  final String? avatar;

  Map<String, dynamic> toJson() => _$MentorToJson(this);
}
