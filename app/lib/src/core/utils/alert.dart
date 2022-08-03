// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Alert {
  static void networkError(
    BuildContext context, {
    required String connectionError,
    required String acceptButton,
  }) {
    showAlert(
      context,
      connectionError,
    );
  }

  static Future<void> showAlert(
    BuildContext context,
    String? message, {
    String title = 'Alert',
    Function()? onPressOK,
    bool isPop = true,
  }) async {
    // set up the button
    await showDialog<void>(
      context: context,
      builder: (BuildContext _) {
        return WillPopScope(
          onWillPop: () async => false,
          child: CupertinoAlertDialog(
            title: Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
            content: Text(
              message ?? 'Có lỗi xảy ra, vui lòng thử lại sau',
              style: const TextStyle(
                color: Colors.grey,
                height: 1.5,
                fontSize: 13,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
            ),
            actions: <Widget>[
              TextButton(
                style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(
                    const TextStyle(color: Colors.blue),
                  ),
                ),
                onPressed: () {
                  if (isPop) {
                    Navigator.of(context).pop();
                  }
                  onPressOK?.call();
                },
                child: const Text('Accept'),
              ),
            ],
          ),
        );
      },
    );
  }

  static void popup(BuildContext context, Widget widget) {
    showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) {
        return widget;
      },
    );
  }
}
