// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/services.dart';

// Project imports:
import 'map_mockup_api.dart';

class MockApi {
  static Future<Map<String, dynamic>?> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return mock(
      getJsonNameForGetRequest(
        endpoint,
        queryParameters: queryParameters,
      ),
    );
  }

  static Future<Map<String, dynamic>?> post(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return mock(
      getJsonNameForPostRequest(
        endpoint,
        data: data,
        queryParameters: queryParameters,
      ),
    );
  }

  static Future<Map<String, dynamic>?> mock(String? endpoint) async {
    // the way how to load assets in packages
    final responseStr =
        await rootBundle.loadString('assets/mockups/$endpoint.json');
    final dynamic responseJson = json.decode(responseStr);

    return responseJson as Map<String, dynamic>?;
  }
}
