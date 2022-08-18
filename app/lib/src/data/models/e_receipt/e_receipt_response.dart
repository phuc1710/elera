import 'package:json_annotation/json_annotation.dart';

part 'e_receipt_response.g.dart';

@JsonSerializable()
class EReceiptResponseModel {
    EReceiptResponseModel({
        required this.status,
        required this.code,
        required this.message,
        required this.data,
    });

    factory EReceiptResponseModel.fromJson(Map<String, dynamic> json) => _$EReceiptResponseModelFromJson(json);

    final int status;
    final int code;
    final String message;
    final EReceiptModel? data;

    Map<String, dynamic> toJson() => _$EReceiptResponseModelToJson(this);
}

@JsonSerializable()
class EReceiptModel {
   EReceiptModel({
        required this.courseName,
        required this.courseCategory,
        required this.name,
        required this.phone,
        required this.email,
        required this.country,
        required this.price,
        required this.paymentMethod,
        required this.date,
        required this.transactionId,
        required this.status,
    });

    factory EReceiptModel.fromJson(Map<String, dynamic> json) => _$EReceiptModelFromJson(json);

    @JsonKey(name: 'course_name') 
    final String courseName;

    @JsonKey(name: 'course_category') 
    final String courseCategory;
    final String name;
    final String phone;
    final String email;
    final String country;
    final String price;

    @JsonKey(name: 'payment_method') 
    final String paymentMethod;
    final String date;

    @JsonKey(name: 'transaction_id') 
    final String transactionId;
    final String status;

    Map<String, dynamic> toJson() => _$EReceiptModelToJson(this);
}
