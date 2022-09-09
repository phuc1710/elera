import 'package:auto_route/auto_route.dart';
import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';

import '../../config/router/routes.dart';
import '../../domain/usecases/clear_cache_usecase.dart';
import '../../injector/injector.dart';
import 'base_bottom_sheet.dart';
import 'base_button.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return ListTile(
      leading: const Icon(Icons.logout, size: 35, color: Colors.red),
      minLeadingWidth: 20,
      title: Text(
        l10n.logOut,
        textAlign: TextAlign.start,
        style:
            Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.red),
      ),
      onTap: () {
        showBaseBottomSheet(
          context: context,
          title: l10n.logOut,
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
                        onTap: () => logOut(context),
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

  Future<void> logOut(BuildContext context) async {
    final clearCacheUC = getIt<ClearCacheUseCase>();
    await clearCacheUC();
    await context.router.navigateNamed(Routes.signIn);
  }
}
