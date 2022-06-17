import 'package:flutter/material.dart';

import '../widgets/gender_dropdown.dart';
import '../widgets/information_input.dart';
import '../widgets/main_action_button.dart';
import '../widgets/phone_number_input.dart';

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
        children: [
          CircleAvatar(
            radius: MediaQuery.of(context).size.width * 0.17,
            backgroundColor: Colors.red,
          ),
          const InformationInput(hintText: 'Full Name'),
          const InformationInput(hintText: 'Nickname'),
          const InformationInput(
            hintText: 'Date of Birth',
            suffixIcon: Icon(Icons.date_range_rounded),
          ),
          const InformationInput(
            hintText: 'Email',
            suffixIcon: Icon(Icons.email_rounded),
          ),
          const PhoneNumberInput(),
          const GenderDropdown(),
          const MainActionButton()
        ],
      ),
    );
  }
}
