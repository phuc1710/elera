import 'package:flutter/material.dart';

import 'information_input.dart';

class PhoneNumberInput extends StatefulWidget {
  const PhoneNumberInput({Key? key}) : super(key: key);

  @override
  State<PhoneNumberInput> createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  String? dropDownFlagValue = 'US';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.03,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: dropDownFlagValue,
              style: Theme.of(context).textTheme.displaySmall,
              items: const [
                DropdownMenuItem(
                  value: 'US',
                  child: Text(
                    'US',
                  ),
                )
              ],
              onChanged: onDropDownFlagChanged,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: const InformationInput(
              hintText: 'Phone Number',
              keyboardtype: TextInputType.number,
            ),
          ),
        ],
      ),
    );
  }

  void onDropDownFlagChanged(String? value) {
    setState(() {
      dropDownFlagValue = value;
    });
  }
}
