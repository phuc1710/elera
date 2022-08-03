import 'package:flutter/material.dart';

import '../../../core/params/appbar_params.dart';
import '../../widgets/base_appbar.dart';
import '../widgets/setting_tile.dart';

class NotificationSettingsView extends StatefulWidget {
  const NotificationSettingsView({Key? key}) : super(key: key);

  @override
  State<NotificationSettingsView> createState() =>
      _NotificationSettingsViewState();
}

class _NotificationSettingsViewState extends State<NotificationSettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        AppBarParams(context, title: 'Notification', backgroundColor: Colors.transparent),
      ),
      body: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SettingTile(
                value: false,
                onChange: (val) {},
                title: 'General Notification',
              ),
              SettingTile(
                value: false,
                onChange: (val) {},
                title: 'Sound',
              ),
              SettingTile(
                value: false,
                onChange: (val) {},
                title: 'Vibrate',
              ),
              SettingTile(
                value: false,
                onChange: (val) {},
                title: 'Special Offers',
              ),
              SettingTile(
                value: false,
                onChange: (val) {},
                title: 'Promo & Discount',
              ),
              SettingTile(
                value: false,
                onChange: (val) {},
                title: 'Payment',
              ),
              SettingTile(
                value: false,
                onChange: (val) {},
                title: 'Cashback',
              ),
              SettingTile(
                value: false,
                onChange: (val) {},
                title: 'App Updates',
              ),
              SettingTile(
                value: false,
                onChange: (val) {},
                title: 'New Service Available',
              ),
              SettingTile(
                value: false,
                onChange: (val) {},
                title: 'New Tips Available',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
