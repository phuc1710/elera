import 'package:json_annotation/json_annotation.dart';

part 'course_response_model.g.dart';

final courseList = [
  CourseModelItem(
    '3D Design',
    '3D Design Illustration',
    'assets/images/course_1.png',
    r'$48',
    r'$80',
    4.8,
    '8.289',
    false,
  ),
  CourseModelItem(
    'Entrepreneurship',
    'Digital Entrepreneurship',
    'assets/images/course_2.jpg',
    r'$39',
    '',
    4.9,
    '6.182',
    false,
  ),
  CourseModelItem(
    'UI/UX Design',
    'Learn UX User Persona',
    'assets/images/course_3.jpg',
    r'$42',
    r'$75',
    4.7,
    '7.938',
    false,
  )
];

final bookmarkList = courseList.where((c) => c.isBookmarked).toList();

@JsonSerializable()
class CourseResponseModel {
  CourseResponseModel({this.status, this.data, this.message});

  factory CourseResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CourseResponseModelFromJson(json);
  @JsonKey(name: 'status')
  final int? status;

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'data')
  final CourseModel? data;

  Map<String, dynamic> toJson() => _$CourseResponseModelToJson(this);
}

@JsonSerializable()
class CourseModel {
  CourseModel(this.courseList);

factory CourseModel.fromJson(Map<String, dynamic> json) =>
      _$CourseModelFromJson(json);
  
  @JsonKey(name: 'items', defaultValue: <CourseModelItem?>[])
  final List<CourseModelItem?> courseList;

  Map<String, dynamic> toJson() => _$CourseModelToJson(this);
}

@JsonSerializable()
class CourseModelItem {
  CourseModelItem(
    this.tag,
    this.name,
    this.imagePath,
    this.price,
    this.originalPrice,
    this.rating,
    this.studentCount,
    this.isBookmarked,
  );

  factory CourseModelItem.fromJson(Map<String, dynamic> json) =>
      _$CourseModelItemFromJson(json);

  @JsonKey(name: 'tag')
  final String tag;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'imagePath')
  final String imagePath;

  @JsonKey(name: 'price')
  final String price;

  @JsonKey(name: 'original_price')
  final String originalPrice;

  @JsonKey(name: 'rating')
  final double rating;

  @JsonKey(name: 'student_count')
  final String studentCount;

  @JsonKey(name: 'is_bookmarked')
  bool isBookmarked;

  Map<String, dynamic> toJson() => _$CourseModelItemToJson(this);
}
