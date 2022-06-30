// Project imports:
import 'api_loyalty_provider.dart';
import 'api_provider.dart';
import 'api_upload_provider.dart';
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
      baseUrl: EndPoints.sandboxBaseUrl,
      enableLogger: enableLogger,
      getHeaders: getHeadersApiProvider,
    );
    uploadProvider = UploadProvider(
      baseUrl: StaticEndPoints.baseUrl,
      enableLogger: enableLogger,
    );
    loyaltyProvider = LoyaltyProvider(
      baseUrl: LoyaltyEndPoints.sandboxLoyaltyBaseUrl,
      enableLogger: enableLogger,
    );
  }

  Network._production({
    required this.enableLogger,
    required this.environment,
    required this.getHeadersApiProvider,
  }) {
    apiProvider = ApiProvider(
      baseUrl: EndPoints.productionBaseUrl,
      enableLogger: enableLogger,
      getHeaders: getHeadersApiProvider,
    );
    uploadProvider = UploadProvider(
      baseUrl: StaticEndPoints.baseUrl,
      enableLogger: enableLogger,
    );
    loyaltyProvider = LoyaltyProvider(
      baseUrl: LoyaltyEndPoints.productionLoyaltyBaseUrl,
      enableLogger: enableLogger,
    );
  }
  final bool enableLogger;

  final Environment environment;

  final Future<Map<String, dynamic>> Function() getHeadersApiProvider;

  late ApiProvider apiProvider;

  late UploadProvider uploadProvider;

  late LoyaltyProvider loyaltyProvider;
}
