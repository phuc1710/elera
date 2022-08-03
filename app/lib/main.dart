import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/config/router/app_router.dart';
import 'src/core/utils/utils.dart';
import 'src/injector/injector.dart';
import 'src/presentation/_blocs/app_multi_bloc_provider.dart';

Future<void> main() async {
  Utils.addGoogleFontsLicense();

  WidgetsFlutterBinding.ensureInitialized();
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
  ThemeData _theme = AppTheme.light;
  ThemeData _darkTheme = AppTheme.dark;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (BuildContext context) => getIt<ThemeBloc>(),
        )
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<ThemeBloc, ThemeState>(
            listener: (context, state) {
              if (state is DarkThemeSuccess) {
                _theme = AppTheme.dark;
                _darkTheme = AppTheme.dark;
              }
              if (state is LightThemeSuccess) {
                _theme = AppTheme.light;
                _darkTheme = AppTheme.light;
              }
            },
          )
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return MaterialApp.router(
              title: 'E-Learning',
              debugShowCheckedModeBanner: false,
              theme: _theme,
              darkTheme: _darkTheme,
              // theme: theme(),
              routerDelegate: _appRouter.delegate(),
              routeInformationParser: _appRouter.defaultRouteParser(),
            );
          },
        ),
      ),
    );
  }
}
