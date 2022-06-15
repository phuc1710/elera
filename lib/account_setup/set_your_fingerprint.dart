import 'package:elearning/onboarding/onboarding.dart';
import 'package:elearning/widgets/main_action_ink.dart';
import 'package:flutter/material.dart';

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
      child: ListView(children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.width * 0.05,
            MediaQuery.of(context).size.height * 0.1,
            MediaQuery.of(context).size.width * 0.05,
            MediaQuery.of(context).size.height * 0.05,
          ),
          child: Text(
            'Add a fingerprint to make your account more secure',
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Image.asset('assets/images/fingerprint.png')),
        Padding(
          padding: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.width * 0.05,
            MediaQuery.of(context).size.height * 0.1,
            MediaQuery.of(context).size.width * 0.05,
            MediaQuery.of(context).size.height * 0.05,
          ),
          child: Text(
            'Please put your finger on the fingerprint scanner to get started',
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
        ),
        const ActionButtonRow(),
      ]),
    );
  }
}

class ActionButtonRow extends StatelessWidget {
  const ActionButtonRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.02,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(40),
            onTap: () {
              showWelcomeDialog(context);
            },
            child: const MainActionInk(
              buttonString: 'Skip',
              width: 0.4,
              isMainAction: true,
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(40),
            onTap: () {
              showWelcomeDialog(context);
            },
            child: const MainActionInk(
              buttonString: 'Continue',
              width: 0.4,
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showWelcomeDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          // Future.delayed(const Duration(seconds: 2), () {
          //   Navigator.of(context).pop();
          //   Navigator.of(context).pushAndRemoveUntil(
          //       MaterialPageRoute(builder: (context) => const Onboarding()),
          //       (route) => false);
          // });
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            title: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.22 ,child: Image.asset('assets/images/welcome_dialog.png')),
                Text(
                  'Congratulation!',
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Your account is ready to use. You will be redirected to the Home page in a few seconds..',
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: CircularProgressIndicator.adaptive(),
                ),
              ],
            ),
            contentTextStyle: Theme.of(context).textTheme.displayMedium,
          );
        });
  }
}
