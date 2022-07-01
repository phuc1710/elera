import 'package:flutter/material.dart';

import 'base_bottom_sheet.dart';
import 'base_button.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.logout, size: 35, color: Colors.red),
      title: Text(
        'Logout',
        textAlign: TextAlign.start,
        style:
            Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.red),
      ),
      onTap: () {
        showBaseBottomSheet(
          context: context,
          title: 'Logout',
          child: Column(
            children: [
              SizedBox(
                width: double.maxFinite,
                child: Text(
                  'Are You sure you want to logout?',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.black, fontSize: 20),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: BaseButton(
                        title: 'Cancel',
                        color: Colors.lightBlue.withOpacity(0.1),
                        titleColor: Colors.blue,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: BaseButton(
                        title: 'Yes, Logout',
                        titleColor: Colors.white,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
