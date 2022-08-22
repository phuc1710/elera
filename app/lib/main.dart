import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/config/router/app_router.dart';
import 'src/core/utils/utils.dart';
import 'src/data/datasources/app_datasources.dart';
import 'src/injector/injector.dart';
import 'src/presentation/_blocs/app_multi_bloc_provider.dart';

Future<void> main() async {
  Utils.addGoogleFontsLicense();

  WidgetsFlutterBinding.ensureInitialized();
  await AppDataSources.init();
  await initializeDependencies();

  Future.delayed(const Duration(milliseconds: 150), () => runApp(const App()));
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => getIt<ThemeBloc>()),
        BlocProvider(
          create: (BuildContext context) =>
              getIt<LocaleBloc>()..add(LocaleCached()),
        )
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) => MaterialApp.router(
          title: 'E-Learning',
          debugShowCheckedModeBanner: false,
          theme: state.theme,
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
          locale: context.watch<LocaleBloc>().state.locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      ),
    );
  }
}
