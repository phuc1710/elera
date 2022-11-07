import 'package:ez_intl/ez_intl.dart';
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
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: buildAppBar(
        AppBarParams(
          context,
          title: l10n.notification,
          backgroundColor: Colors.transparent,
        ),
      ),
      body: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SettingTile(
                value: false,
                onChange: (val) {},
                title: l10n.generalNotification,
              ),
              SettingTile(value: false, onChange: (val) {}, title: l10n.sound),
              SettingTile(
                value: false,
                onChange: (val) {},
                title: l10n.vibrate,
              ),
              SettingTile(
                value: false,
                onChange: (val) {},
                title: l10n.specialOffers,
              ),
              SettingTile(
                value: false,
                onChange: (val) {},
                title: l10n.promoAndDiscount,
              ),
              SettingTile(
                value: false,
                onChange: (val) {},
                title: l10n.payment,
              ),
              SettingTile(
                value: false,
                onChange: (val) {},
                title: l10n.cashback,
              ),
              SettingTile(
                value: false,
                onChange: (val) {},
                title: l10n.appUpdates,
              ),
              SettingTile(
                value: false,
                onChange: (val) {},
                title: l10n.newServiceAvailable,
              ),
              SettingTile(
                value: false,
                onChange: (val) {},
                title: l10n.newTipsAvailable,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
