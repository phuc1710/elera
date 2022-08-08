import 'package:flutter/material.dart';

import '../../../core/params/appbar_params.dart';
import '../../notification_settings/widgets/setting_tile.dart';
import '../../widgets/base_appbar.dart';
import '../../widgets/base_button.dart';

class SecurityView extends StatefulWidget {
  const SecurityView({Key? key}) : super(key: key);

  @override
  State<SecurityView> createState() => _SecurityViewState();
}

class _SecurityViewState extends State<SecurityView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        AppBarParams(
          context,
          title: 'Security',
          backgroundColor: Colors.transparent,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          children: [
            SettingTile(
              value: true,
              onChange: (val) {},
              title: 'Remember me',
            ),
            SettingTile(
              value: false,
              onChange: (val) {},
              title: 'Face ID',
            ),
            SettingTile(
              value: true,
              onChange: (val) {},
              title: 'Biometric ID',
            ),
            actionItem(
              context,
              title: 'Google Authenticator',
              onTap: () {},
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.maxFinite,
              child: BaseButton(
                title: 'Change PIN',
                titleColor: Theme.of(context).colorScheme.primary,
                color: Theme.of(context).colorScheme.secondary,
                onTap: () {},
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.maxFinite,
              child: BaseButton(
                title: 'Change Password',
                titleColor: Theme.of(context).colorScheme.primary,
                color: Theme.of(context).colorScheme.secondary,
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget actionItem(
    BuildContext context, {
    required String title,
    Icon? icon,
    required Function() onTap,
    String? value,
  }) {
    return ListTile(
      leading: icon,
      onTap: onTap,
      title: Text(
        title,
        textAlign: TextAlign.start,
        style: Theme.of(context)
            .textTheme
            .bodyText2
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
      trailing:
          const Icon(Icons.arrow_forward_ios, size: 17, color: Colors.black),
    );
  }
}
