import 'package:flutter/material.dart';

import '../widgets/action_button_row.dart';

class SetYourFingerprintView extends StatelessWidget {
  const SetYourFingerprintView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Set your fingerprint',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            foregroundColor: Colors.black,
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: MediaQuery.of(context).size.height * 0.0995,
          ),
          body: const ScaffoldBody(),
        ),
      ),
    );
  }
}

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
            padding: getPadding(context),
            child: Text(
              'Add a fingerprint to make your account more secure',
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Image.asset('assets/images/fingerprint.png'),
          ),
          Padding(
            padding: getPadding(context),
            child: Text(
              'Please put your finger on the fingerprint scanner to get started',
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
          ),
          const ActionButtonRow(),
        ],
      ),
    );
  }

  EdgeInsets getPadding(BuildContext context) {
    return EdgeInsets.fromLTRB(
      MediaQuery.of(context).size.width * 0.05,
      MediaQuery.of(context).size.height * 0.1,
      MediaQuery.of(context).size.width * 0.05,
      MediaQuery.of(context).size.height * 0.05,
    );
  }
}
