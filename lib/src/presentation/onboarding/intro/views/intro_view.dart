import 'package:flutter/material.dart';

import '../widgets/scaffold_body.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  int page = 0;
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: ScaffoldBody(),
      ),
    );
  }
}
