import 'package:flutter/material.dart';

import 'src/config/theme/app_theme.dart';
import 'src/injector.dart';
import 'src/presentation/onboarding/intro/views/intro_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Learning',
      home: const IntroView(),
      debugShowCheckedModeBanner: false,
      theme: theme(),
    );
  }
}
