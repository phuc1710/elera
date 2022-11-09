import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../widgets/set_your_fingerprint_body.dart';

class SetYourFingerprintView extends StatelessWidget {
  const SetYourFingerprintView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      // TODO(phucndh): implement fingerprint flow
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context).setYourFingerprint,
              style: Theme.of(context).textTheme.headline6,
            ),
            leadingWidth: 35,
            foregroundColor: const Color(0xff212121),
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: const Icon(IconlyLight.arrow_left),
            toolbarHeight: MediaQuery.of(context).size.height * 0.0995,
          ),
          body: const SetYourFingerprintBody(),
        ),
      ),
    );
  }
}
