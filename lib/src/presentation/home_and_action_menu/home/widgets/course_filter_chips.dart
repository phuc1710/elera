import 'package:flutter/material.dart';

class CourseFilterChips extends StatefulWidget {
  const CourseFilterChips({
    Key? key,
  }) : super(key: key);

  @override
  State<CourseFilterChips> createState() => _CourseFilterChipsState();
}

class _CourseFilterChipsState extends State<CourseFilterChips> {
  int _selectedIndex = 1;
  final List<String> _filterList = [
    '🔥 All',
    '💡 3D Design',
    '💰 Bussiness',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.1,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: _filterList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, int index) => Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ChoiceChip(
              selected: _selectedIndex == index,
              backgroundColor: Colors.white,
              side: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 2,
              ),
              label: Text(
                _filterList[index],
              ),
              labelStyle: _selectedIndex == index
                  ? Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      )
                  : Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w700,
                      ),
              selectedColor: Theme.of(context).primaryColor,
              onSelected: (bool b) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
