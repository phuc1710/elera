import 'package:flutter/material.dart';

import 'src/config/theme/app_theme.dart';
import 'src/presentation/onboarding/onboarding/views/onboarding_view.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Onboarding(),
      debugShowCheckedModeBanner: false,
      theme: theme(),
    );
  }
}
