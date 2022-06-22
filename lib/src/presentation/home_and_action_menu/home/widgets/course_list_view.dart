import 'package:flutter/material.dart';

import 'course_card.dart';

class CourseListView extends StatelessWidget {
  const CourseListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: Column(
        children: [
          const CourseCard(
            tag: '3D Design',
            name: '3D Design Illustration',
            imagePath: 'assets/images/course_1.png',
            price: r'$48',
            originalPrice: r'$80',
            rating: 4.8,
            studentCount: '8.289',
          ),
          CourseCard(
            tag: 'Enterpreneurship',
            name: 'Digital Enterpreneurship'.replaceAll('', '\u{200B}'),
            imagePath: 'assets/images/course_2.jpg',
            price: r'$39',
            originalPrice: '',
            rating: 4.9,
            studentCount: '6.182',
          ),
          CourseCard(
            tag: 'UI/UX Design',
            name: 'Learn UX User Persona'.replaceAll('', '\u{200B}'),
            imagePath: 'assets/images/course_3.jpg',
            price: r'$42',
            originalPrice: r'$75',
            rating: 4.9,
            studentCount: '7.398',
          ),
        ],
      ),
    );
  }
}
