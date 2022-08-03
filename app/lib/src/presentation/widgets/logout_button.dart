import 'package:flutter/material.dart';

import 'base_bottom_sheet.dart';
import 'base_button.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.logout, size: 35, color: Colors.red),
      minLeadingWidth: 20,
      title: Text(
        'Logout',
        textAlign: TextAlign.start,
        style:
            Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.red),
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
                  'Are you sure you want to logout?',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(fontWeight: FontWeight.bold),
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
                        color: Theme.of(context).colorScheme.secondary,
                        titleColor: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: BaseButton(
                        title: 'Yes, Logout',
                        titleColor: Colors.white,
                        color: Theme.of(context).colorScheme.primary,
                        shadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(51, 94, 247, 0.25),
                            blurRadius: 24,
                            offset: Offset(4, 8),
                          )
                        ],
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
