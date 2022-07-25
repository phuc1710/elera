import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../core/nd_network/nd_network.dart';
import '../core/nd_network/network/environment.dart' as env;
// Project imports:
import 'injector.config.dart';

final injector = GetIt.instance;

@InjectableInit()
void configureDependencies() => $initGetIt(injector);

Future<void> initializeDependencies() async {
  injector.registerSingleton<Network>(
    Network(
      enableLogger: true,
      environment: env.Environment.sandbox,
      getHeadersApiProvider: () async {
        final Map<String, dynamic> header = <String, dynamic>{
          'product': 'postman',
          'token':
              '894ca68e81e66b957731debfdca118a063afcd06e7e01974bf39aa7acfb3d996',
        };

        return header;
      },
    ),
  );

  configureDependencies();
}
