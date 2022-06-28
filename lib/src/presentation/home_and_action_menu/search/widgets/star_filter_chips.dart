import 'package:flutter/material.dart';

class StarFilterChips extends StatefulWidget {
  const StarFilterChips({Key? key}) : super(key: key);

  @override
  State<StarFilterChips> createState() => _StarFilterChipsState();
}

class _StarFilterChipsState extends State<StarFilterChips> {
  final List<String> _courseFilterList = ['All', '5', '4', '3', '2', '1'];

  String selectedCourseTag = 'All';

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
            avatar: Icon(
              Icons.star_rounded,
              color: _courseFilterList[index] == selectedCourseTag
                  ? Colors.white
                  : Theme.of(context).primaryColor,
              size: MediaQuery.of(context).size.width * 0.05,
            ),
            backgroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.01),
            label: Text(
              _courseFilterList[index],
            ),
            side: BorderSide(width: 2, color: Theme.of(context).primaryColor),
            selected: _courseFilterList[index] == selectedCourseTag,
            selectedColor: Theme.of(context).primaryColor,
            labelStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: _courseFilterList[index] == selectedCourseTag
                      ? Colors.white
                      : Theme.of(context).primaryColor,
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
