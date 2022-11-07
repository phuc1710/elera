import 'package:ez_intl/l10n/arb/app_localizations.dart';
import 'package:flutter/material.dart';

import '../widgets/intro_body.dart';

class IntroView extends StatefulWidget {
  const IntroView({Key? key}) : super(key: key);

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  @override
  Widget build(BuildContext context) {
    final _initButtonString = AppLocalizations.of(context).next;

    return SafeArea(
      child: Scaffold(body: IntroBody(initButtonString: _initButtonString)),
    );
  }
}
