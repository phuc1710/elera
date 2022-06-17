import 'package:flutter/material.dart';

class GenderDropdown extends StatefulWidget {
  const GenderDropdown({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GenderDropdownState();
}

class _GenderDropdownState extends State<GenderDropdown> {
  String? dropDownGenderValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.03,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: dropDownGenderValue,
          style: Theme.of(context).textTheme.displaySmall,
          isExpanded: true,
          hint: const Text('Gender'),
          items: getGenderItems(),
          onChanged: onDropDownGenderChanged,
        ),
      ),
    );
  }

  void onDropDownGenderChanged(String? value) {
    setState(() {
      dropDownGenderValue = value;
    });
  }

  List<DropdownMenuItem<String>> getGenderItems() {
    return ['Male', 'Female']
        .map(
          (e) => DropdownMenuItem(
            value: e,
            child: Text(e),
          ),
        )
        .toList();
  }
}
