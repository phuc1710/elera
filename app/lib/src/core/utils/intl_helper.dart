// Package imports:
import 'package:intl/intl.dart';

// Project imports:

class IntlHelper {
  static DateFormat dateFormatter = DateFormat('dd/MM/yyyy');

  static DateFormat dateFormatter2 = DateFormat('yyyy-MM-ddTHH:mm:ssZ');

  static DateFormat dateFormatter3 = DateFormat('MM/dd/yyyy');

  static DateFormat hourFormatter = DateFormat(DateFormat.HOUR24_MINUTE);

  static String convertUTCToddMMyyyy(String dateTime) {
    try {
      final DateTime value = dateFormatter2.parseUTC(dateTime).toLocal();

      return dateFormatter.format(value);
    } catch (error) {
      return dateTime;
    }
  }

  static String convertMMddyyyyToddMMyyyy(String dateTime) {
    try {
      final DateTime value = dateFormatter3.parse(dateTime);

      return dateFormatter.format(value);
    } catch (error) {
      return dateTime;
    }
  }
}

extension DateTimeExtensionsString on String {
  int? getTimeStamp(DateFormat format) {
    try {
      return format.parse(this).millisecondsSinceEpoch;
    } catch (error) {
      return null;
    }
  }

  DateTime? getDateTime(DateFormat format) {
    try {
      return format.parse(this);
    } catch (error) {
      return null;
    }
  }
}

extension DateTimeExtensions on DateTime {
  String formatByDateFormat(DateFormat dateFormat) {
    return dateFormat.format(this);
  }
}
