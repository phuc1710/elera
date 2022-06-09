import 'package:flutter/material.dart';

import 'intro.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: loading(context),
        ),
      ),
    );
  }

  Widget loading(BuildContext context) {
    return FutureBuilder(
        future: _intro(),
        builder: (context, snapshot) {
          return Center(
            child: Image.asset('assets/images/logo.png'),
          );
        });
  }

  Future<String> _intro() async {
    await Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => const Intro()));
    });
    return "Pushed";
  }
}
