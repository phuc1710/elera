import 'package:flutter/material.dart';

import 'src/config/router/app_router.dart';
import 'src/config/theme/app_theme.dart';
import 'src/core/utils/utils.dart';
import 'src/data/datasources/app_datasources.dart';
import 'src/injector/injector.dart';

Future<void> main() async {
  Utils.addGoogleFontsLicense();

  WidgetsFlutterBinding.ensureInitialized();
  await AppDataSources.init();
  await initializeDependencies();

  Future.delayed(const Duration(milliseconds: 150), () => runApp(App()));
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'E-Learning',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
