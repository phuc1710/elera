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
        };

        return header;
      },
    ),
  );

  configureDependencies();
}
