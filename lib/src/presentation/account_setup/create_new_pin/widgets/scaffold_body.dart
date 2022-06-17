import 'package:flutter/material.dart';

import '../../../onboarding/intro/widgets/main_action_ink.dart';
import '../../set_your_fingerprint/views/set_your_fingerprint.dart';
import 'pin_code_input.dart';

class ScaffoldBody extends StatelessWidget {
  const ScaffoldBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.05,
              MediaQuery.of(context).size.height * 0.1,
              MediaQuery.of(context).size.width * 0.05,
              MediaQuery.of(context).size.height * 0.05,
            ),
            child: Text(
              'Add a pin number to make your account more secure',
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
          ),
          const PinCodeInput(
            obscureText: false,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.02,
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push<dynamic>(
                  MaterialPageRoute<dynamic>(
                    builder: (context) => const SetYourFingerprintView(),
                  ),
                );
              },
              child: const MainActionInk(buttonString: 'Continue'),
            ),
          )
        ],
      ),
    );
  }
}
