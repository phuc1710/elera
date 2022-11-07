import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';

import 'action_button_row.dart';

class SetYourFingerprintBody extends StatelessWidget {
  const SetYourFingerprintBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: getPadding(context),
            child: Text(
              l10n.fingerprintCreationDescription1,
              style: Theme.of(context).textTheme.bodyText2,
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
              l10n.fingerprintCreationDescription2,
              style: Theme.of(context).textTheme.bodyText2,
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
