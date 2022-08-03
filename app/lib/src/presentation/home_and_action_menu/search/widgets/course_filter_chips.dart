import 'package:flutter/material.dart';

class CourseFilterChips extends StatefulWidget {
  const CourseFilterChips({Key? key}) : super(key: key);

  @override
  State<CourseFilterChips> createState() => _CourseFilterChipsState();
}

class _CourseFilterChipsState extends State<CourseFilterChips> {
  final List<String> _courseFilterList = [
    '🔥 All',
    '💡 3D Design',
    '💰 Bussiness',
  ];

  String selectedCourseTag = '🔥 All';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: _courseFilterList.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 8),
          child: ChoiceChip(
            backgroundColor: Colors.white,
            label: Text(
              _courseFilterList[index],
            ),
            side: BorderSide(width: 2, color: Theme.of(context).colorScheme.primary),
            selected: _courseFilterList[index] == selectedCourseTag,
            selectedColor: Theme.of(context).primaryColor,
            labelStyle: Theme.of(context).textTheme.caption?.copyWith(
                  color: _courseFilterList[index] == selectedCourseTag
                      ? Colors.white
                      : Theme.of(context).colorScheme.primary,
                ),
            onSelected: (bool b) => setState(() {
              selectedCourseTag = _courseFilterList[index];
            }),
          ),
        ),
      ),
    );
  }
}
