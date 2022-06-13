import 'dart:developer';
import 'dart:io';

import 'status_code.dart';

Future<bool> checkConnection() async {
  final hasConnection = await Connection.status();
  return hasConnection;
}

class Connection {
  static Future<bool> status() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        log('connected');
        return true;
      }
    } on SocketException catch (_) {
      log('not connected');
      return false;
    }
    return false;
  }
}

void handleExceptionCase(int? statusCode, {String? message}) {
  // Do something with response data
  switch (statusCode) {
    case StatusCode.tokenExpired:
      {
        // do something
        break;
      }
    default:
      break;
  }
}

Map<String, dynamic> noConnectionRes = {
  'status': -4,
  'message': 'No internet connection, please try again'
};
