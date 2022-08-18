import 'package:json_annotation/json_annotation.dart';

part 'transactions_response_model.g.dart';

@JsonSerializable()
class TransactionsResponseModel {
  TransactionsResponseModel({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });

  factory TransactionsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionsResponseModelFromJson(json);

  final int status;
  final int code;
  final String message;
  final TransactionsDataModel? data;

  Map<String, dynamic> toJson() => _$TransactionsResponseModelToJson(this);
}

@JsonSerializable()
class TransactionsDataModel {
  TransactionsDataModel({
    required this.items,
  });

  factory TransactionsDataModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionsDataModelFromJson(json);

  final List<TransactionsModel>? items;

  Map<String, dynamic> toJson() => _$TransactionsDataModelToJson(this);
}

@JsonSerializable()
class TransactionsModel {
  TransactionsModel({
    required this.courseName,
    required this.courseImage,
    required this.status,
  });

  factory TransactionsModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionsModelFromJson(json);

  @JsonKey(name: 'course_name')
  final String courseName;

  @JsonKey(name: 'course_image')
  final String courseImage;
  final String status;

  Map<String, dynamic> toJson() => _$TransactionsModelToJson(this);
}
