// Flutter imports:
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../params/date_picker_param.dart';
import 'intl_helper.dart';

void showYearPicker(
  BuildContext context, {
  Function? onChange,
  required void Function(String) onConfirm,
  TextStyle? itemTextStyle,
  required String doneText,
}) {
  final DateTime dateTimeNow = DateTime.now();
  // age must be from greater than 25 year-old and less than 100 year-old
  final int maxYear = dateTimeNow.year - 25;
  final int minYear = dateTimeNow.year - 100;
  final List<String> values =
      List<String>.generate(maxYear - minYear + 1, (int i) => '${i + minYear}')
          .reversed
          .toList();
  final List<Padding> widgets = values
      .map(
        (String value) => Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            value,
            style: itemTextStyle,
          ),
        ),
      )
      .toList();
  showPicker(
    context,
    doneText: doneText,
    onSelectedItemChanged: (int index) {
      log('onSelectedItemChanged ${values[index]}');

      onConfirm(values[index]);
    },
    values: widgets,
  );
}

void showPicker(
  BuildContext context, {
  required void Function(int) onSelectedItemChanged,
  String doneText = '',
  List<Widget> values = const <Widget>[],
}) {
  showModalBottomSheet<dynamic>(
    context: context,
    builder: (BuildContext context) {
      return Stack(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: CupertinoPicker(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              onSelectedItemChanged: onSelectedItemChanged,
              itemExtent: 50.0,
              children: values,
            ),
          ),
          Positioned(
            right: 0,
            child: InkWell(
              onTap: () => context.router.pop(),
              child: Container(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  doneText,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}

Future<void> showDatePickerView(
  BuildContext context, {
  required DatePickerParam param,
}) async {
  param.dateFormat ??= IntlHelper.dateFormatter;
  final dateTimeNow = DateTime.now();
  final maxYear = dateTimeNow.year + 20;
  final minYear = dateTimeNow.year - 20;
  final minDateTime =
      '$minYear-${dateTimeNow.month.toString().padLeft(2, '0')}-'
      '${dateTimeNow.day.toString().padLeft(2, '0')}';
  final maxDateTime =
      '$maxYear-${dateTimeNow.month.toString().padLeft(2, '0')}-'
      '${dateTimeNow.day.toString().padLeft(2, '0')}';

  var _currentDate = param.initDate ?? DateTime.now();

  await showModalBottomSheet<dynamic>(
    context: context,
    builder: (context) {
      return Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: CupertinoDatePicker(
              initialDateTime: _currentDate,
              onDateTimeChanged: (dateTime) {
                _currentDate = dateTime;
              },
              minimumDate: DateTime.parse(minDateTime),
              maximumDate: DateTime.parse(maxDateTime),
              mode: CupertinoDatePickerMode.date,
            ),
          ),
          _buildAcceptButton(
            context,
            onTap: () {
              param.setModalState(() {
                param.controller?.text =
                    _currentDate.formatByDateFormat(param.dateFormat!);
              });
              context.router.pop();
            },
          )
        ],
      );
    },
  );
}

Widget _buildAcceptButton(BuildContext context, {required Function() onTap}) {
  return Positioned(
    right: 0,
    child: InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          'Accept',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Theme.of(context).primaryColor),
        ),
      ),
    ),
  );
}
