import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';

import 'information_input.dart';

class PhoneNumberInput extends StatefulWidget {
  const PhoneNumberInput({Key? key, required this.controller})
      : super(key: key);

  final TextEditingController controller;

  @override
  State<PhoneNumberInput> createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  String? dropDownFlagValue = 'US';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
          height: screenHeight * 0.07,
          decoration: BoxDecoration(
            color: const Color(0xfffafafa),
            borderRadius: BorderRadius.circular(screenWidth * 0.03),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.05),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: dropDownFlagValue,
                  icon: const Icon(Icons.arrow_drop_down_rounded),
                  iconEnabledColor: const Color(0xff9e9e9e),
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      ?.copyWith(color: const Color(0xff9e9e9e)),
                  items: const [
                    DropdownMenuItem(
                      value: 'US',
                      child: Text('US'),
                    )
                  ],
                  onChanged: onDropDownFlagChanged,
                ),
              ),
            ),
            SizedBox(
              width: screenWidth * 0.7,
              child: InformationInput(
                controller: widget.controller,
                hintText: AppLocalizations.of(context).phoneNumber,
                keyboardtype: TextInputType.number,
                customPadding: EdgeInsets.zero,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void onDropDownFlagChanged(String? value) {
    setState(() {
      dropDownFlagValue = value;
    });
  }
}
