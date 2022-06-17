import 'package:flutter/material.dart';

import '../../intro/views/intro_view.dart';

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
      },
    );
  }

  Future<String> _intro() async {
    await Future<dynamic>.delayed(const Duration(seconds: 3))
        .then((dynamic value) {
      Navigator.pushReplacement<dynamic, Function>(
        context,
        MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const Intro(),
        ),
      );
    });

    return 'Pushed';
  }
}
