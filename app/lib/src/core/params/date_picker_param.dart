// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/intl.dart';

class DatePickerParam {
  DatePickerParam({
    required this.setModalState,
    this.controller,
    this.initDate,
    this.dateFormat,
  });

  final StateSetter setModalState;
  TextEditingController? controller;
  DateTime? initDate;
  DateFormat? dateFormat;
}
