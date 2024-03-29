import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class StarFilterChips extends StatefulWidget {
  const StarFilterChips({Key? key, required this.selectedCallbackAction})
      : super(key: key);

  final Function(String value) selectedCallbackAction;

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
        itemBuilder: (context, index) {
          final bool isCourseSelected =
              _courseFilterList[index] == selectedCourseTag;
          final primaryColor = Theme.of(context).primaryColor;
          final width = MediaQuery.of(context).size.width;

          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              avatar: Icon(
                IconlyBold.star,
                color: isCourseSelected ? Colors.white : primaryColor,
                size: width * 0.05,
              ),
              backgroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: width * 0.01),
              label: Text(getFilter(context, index)),
              side: BorderSide(width: 2, color: primaryColor),
              selected: isCourseSelected,
              selectedColor: primaryColor,
              labelStyle: Theme.of(context).textTheme.caption?.copyWith(
                    color: isCourseSelected ? Colors.white : primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
              onSelected: (bool b) {
                setState(() {
                  selectedCourseTag = _courseFilterList[index];
                });
                widget.selectedCallbackAction(selectedCourseTag);
              },
            ),
          );
        },
      ),
    );
  }

  String getFilter(BuildContext context, int index) {
    final l10n = AppLocalizations.of(context);
    final List<String> _courseFilterList = [l10n.all, '5', '4', '3', '2', '1'];

    return _courseFilterList[index];
  }
}
