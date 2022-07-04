// Project imports:
import 'api_provider.dart';
import 'end_points.dart';
import 'environment.dart';

class Network {
  factory Network({
    required bool enableLogger,
    required Environment environment,
    required Future<Map<String, dynamic>> Function() getHeadersApiProvider,
  }) {
    switch (environment) {
      case Environment.sandbox:
        return Network._sanbox(
          enableLogger: enableLogger,
          environment: environment,
          getHeadersApiProvider: getHeadersApiProvider,
        );
      case Environment.staging:
        return Network._production(
          enableLogger: enableLogger,
          environment: environment,
          getHeadersApiProvider: getHeadersApiProvider,
        );
      case Environment.production:
        return Network._production(
          enableLogger: enableLogger,
          environment: environment,
          getHeadersApiProvider: getHeadersApiProvider,
        );
    }
  }

  Network._sanbox({
    required this.enableLogger,
    required this.environment,
    required this.getHeadersApiProvider,
  }) {
    apiProvider = ApiProvider(
      baseUrl: EndPoints.baseUrl,
      enableLogger: enableLogger,
      getHeaders: getHeadersApiProvider,
    );
  }

  Network._production({
    required this.enableLogger,
    required this.environment,
    required this.getHeadersApiProvider,
  }) {
    apiProvider = ApiProvider(
      baseUrl: EndPoints.baseUrl,
      enableLogger: enableLogger,
      getHeaders: getHeadersApiProvider,
    );
  }
  final bool enableLogger;

  final Environment environment;

  final Future<Map<String, dynamic>> Function() getHeadersApiProvider;

  late ApiProvider apiProvider;
}
