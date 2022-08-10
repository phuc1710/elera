import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../core/nd_network/nd_network.dart';
import '../core/nd_network/network/environment.dart' as env;
// Project imports:
import '../domain/usecases/access_token_usecase.dart';
import 'injector.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => $initGetIt(getIt);

Future<void> initializeDependencies() async {
  getIt.registerSingleton<Network>(
    Network(
      enableLogger: true,
      environment: env.Environment.sandbox,
      getHeadersApiProvider: () async {
        final accessToken = await getIt<AccessTokenUseCase>()();
        final Map<String, dynamic> header = <String, dynamic>{
          'product': 'app',
          'authorization': accessToken,
          'token':
              '2b5fa55f4518e8f3cf810fce6591d347a69027d7916cdd54b6665f06b1a3ffe9',
          'device-info': jsonEncode({
            'app_version': '2.0.0',
            'device_id': '11D8FE9D-863E-4500-9B63-5CE510CDA9CC',
            'firebase_token':
                'cslN7-Ur5x8:APA91bEl32zbyRei_Z_V2ex2zgvx1jeo4qdi47U5WJgFHY7tO5r4FYnVLHLtz5XrVtkFjUZDB-ru45rsZOpc4xuTLHhhGhqJK7221W7OO0VUJfZLs0xlIwwceLTV1BHe84dzlIgf7S60',
            'os_version': '13.2.3',
            'platform': 'ios'
          })
        };

        return header;
      },
    ),
  );

  configureDependencies();
}
