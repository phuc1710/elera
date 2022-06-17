import 'package:flutter/material.dart';

import '../../../onboarding/intro/widgets/main_action_ink.dart';
import '../../create_new_password/views/create_new_password_view.dart';

class MainActionButton extends StatelessWidget {
  const MainActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.02),
      child: InkWell(
        onTap: () {
          Navigator.push<dynamic>(
            context,
            MaterialPageRoute<dynamic>(
              builder: (context) => const CreateNewPasswordView(),
            ),
          );
        },
        child: const MainActionInk(buttonString: 'Continue'),
      ),
    );
  }
}
