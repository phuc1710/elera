import 'package:flutter/material.dart';

import '../widgets/intro_body.dart';

class IntroView extends StatefulWidget {
  const IntroView({Key? key}) : super(key: key);

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  int page = 0;
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: IntroBody(),
      ),
    );
  }
}
