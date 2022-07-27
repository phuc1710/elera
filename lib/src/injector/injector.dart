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
          'product': 'app',
          'authorization': '62e09d57bf80da2d56936980', // TODO(thinhhh): harcode
          'token':
              '2b5fa55f4518e8f3cf810fce6591d347a69027d7916cdd54b6665f06b1a3ffe9',
        };

        return header;
      },
    ),
  );

  configureDependencies();
}
