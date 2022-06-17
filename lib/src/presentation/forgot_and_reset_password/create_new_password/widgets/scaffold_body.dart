import 'package:flutter/material.dart';

import '../../../letsin/signup/widgets/remember_me_check_box.dart';
import '../widgets/main_action_button.dart';
import '../widgets/password_input.dart';

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
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.05,
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.32,
              child: Image.asset('assets/images/new_password.png'),
            ),
          ),
          Text(
            'Create Your New Password',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const PasswordInput(hint: 'Password'),
          const PasswordInput(hint: 'Repeate Password'),
          const RememberMeCheckBox(),
          const MainActionButton()
        ],
      ),
    );
  }
}
