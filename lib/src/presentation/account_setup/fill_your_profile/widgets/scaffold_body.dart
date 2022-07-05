import 'package:flutter/material.dart';

import '../widgets/gender_dropdown.dart';
import '../widgets/information_input.dart';
import '../widgets/main_action_button.dart';
import '../widgets/phone_number_input.dart';
import 'avatar.dart';

class ScaffoldBody extends StatefulWidget {
  const ScaffoldBody({Key? key}) : super(key: key);

  @override
  State<ScaffoldBody> createState() => _ScaffoldBodyState();
}

class _ScaffoldBodyState extends State<ScaffoldBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: ListView(
        children: const [
          Avatar(),
          InformationInput(hintText: 'Full Name'),
          InformationInput(hintText: 'Nickname'),
          // TODO(phucndh): implement date_picker from thinhhh
          InformationInput(
            hintText: 'Date of Birth',
            suffixIcon: Icon(Icons.date_range_rounded),
          ),
          InformationInput(
            hintText: 'Email',
            suffixIcon: Icon(Icons.email_rounded),
          ),
          // TODO(phucndh): implement phone input from thinhhh
          PhoneNumberInput(),
          GenderDropdown(),
          MainActionButton()
        ],
      ),
    );
  }
}
