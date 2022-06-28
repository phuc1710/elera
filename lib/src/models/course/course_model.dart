final courseList = [
  CourseModel(
    '3D Design',
    '3D Design Illustration',
    'assets/images/course_1.png',
    r'$48',
    r'$80',
    4.8,
    '8.289',
    false,
  ),
  CourseModel(
    'Entrepreneurship',
    'Digital Entrepreneurship'.replaceAll('', '\u{200B}'),
    'assets/images/course_2.jpg',
    r'$39',
    '',
    4.9,
    '6.182',
    false,
  ),
  CourseModel(
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

class CourseModel {
  CourseModel(
    this.tag,
    this.name,
    this.imagePath,
    this.price,
    this.originalPrice,
    this.rating,
    this.studentCount,
    this.isBookmarked,
  );

  final String tag;
  final String name;
  final String imagePath;
  final String price;
  final String originalPrice;
  final double rating;
  final String studentCount;
  bool isBookmarked;


}
