import 'package:auto_route/auto_route.dart';
import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/router/app_router.dart';
import '../../../config/router/routes.dart';
import '../../../core/params/appbar_params.dart';
import '../../../injector/injector.dart';
import '../../_blocs/app_multi_bloc_provider.dart';
import '../../widgets/base_appbar.dart';
import '../../widgets/logout_button.dart';
import '../bloc/profile_bloc.dart';
import '../widgets/profile_picture.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    final bool isDarkMode = brightness == Brightness.dark;
    final AppLocalizations l10n = AppLocalizations.of(context);

    return BlocProvider(
      create: (context) => getIt<ProfileBloc>()..add(ProfileStarted()),
      child: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                child: TopAppBar(
                  AppBarParams(
                    context,
                    title: l10n.profile,
                    leading: Image.network(
                      'https://www.pinpng.com/pngs/m/114-1147460_elearning-development-e-learning-icon-orange-hd-png.png',
                      width: 30,
                      height: 30,
                    ),
                    actions: [
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.more_horiz_rounded,
                          color: Color(0xff212121),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              buildUserDisplay(context),
              Divider(
                indent: MediaQuery.of(context).size.width * 0.05,
                endIndent: MediaQuery.of(context).size.width * 0.05,
                color: Colors.grey.withOpacity(0.8),
              ),
              ...actions(context, isDarkMode),
              const LogoutButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget profileActionItem(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Function() onTap,
    String? value,
  }) {
    return ListTile(
      leading: Icon(icon, size: 35),
      minLeadingWidth: 20,
      onTap: onTap,
      title: Row(
        children: [
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          if (value != null)
            Expanded(
              child: Text(
                value,
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            )
        ],
      ),
      trailing:
          const Icon(Icons.arrow_forward_ios, size: 17, color: Colors.black),
    );
  }

  Widget buildUserDisplay(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileFetchSuccess) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            width: double.maxFinite,
            child: Center(
              child: Column(
                children: [
                  ProfilePicture(
                    avatar: state.profile?.avatar,
                    callBack: () {},
                  ),
                  const SizedBox(height: 15),
                  Text(
                    state.profile?.fullName ?? '',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontSize: 24,
                        ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    state.profile?.email ?? '',
                    style: Theme.of(context).textTheme.button,
                  ),
                ],
              ),
            ),
          );
        }

        return const SizedBox();
      },
    );
  }

  // ignore: long-method
  List<Widget> actions(BuildContext context, bool isDarkMode) {
    final l10n = AppLocalizations.of(context);

    return [
      BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileFetchSuccess) {
            return profileActionItem(
              context,
              title: l10n.editProfile,
              icon: Icons.person,
              //! Push object
              onTap: () =>
                  context.router.push(EditProfileRoute(profile: state.profile)),
            );
          }

          return const SizedBox();
        },
      ),
      profileActionItem(
        context,
        title: l10n.notification,
        icon: Icons.notifications,
        onTap: () => context.router.pushNamed(Routes.notificationSettings),
      ),
      profileActionItem(
        context,
        title: l10n.payment,
        icon: Icons.payment,
        onTap: () => context.router.pushNamed(Routes.payment),
      ),
      profileActionItem(
        context,
        title: l10n.security,
        icon: Icons.security,
        onTap: () => context.router.pushNamed(Routes.security),
      ),
      BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          var language = '';
          if (state is ProfileFetchSuccess) {
            language = state.language?.name ?? '';
          }

          return profileActionItem(
            context,
            title: AppLocalizations.of(context).language,
            icon: Icons.language,
            value: language,
            onTap: () => context.router.pushNamed(Routes.language).then(
                  (_) => context.read<ProfileBloc>().add(ProfileStarted()),
                ),
          );
        },
      ),
      ListTile(
        leading: const Icon(Icons.dark_mode_outlined, size: 35),
        onTap: () {
          isDarkMode = !isDarkMode;
        },
        title: Text(
          l10n.darkMode,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        trailing: CupertinoSwitch(
          value: isDarkMode,
          onChanged: (value) {
            context.read<ThemeBloc>().add(ThemeEvent(value));
          },
        ),
      ),
      profileActionItem(
        context,
        title: l10n.privacyPolicy,
        icon: Icons.lock,
        onTap: () => context.router.push(
          PrivacyPolicyRoute(
            url:
                'https://cmapi.ngocdunggroup.com.vn/news/view?id=4a730df1-5d68-454c-99d2-4574f2f04154',
          ),
        ),
      ),
      profileActionItem(
        context,
        title: l10n.helpCenter,
        icon: Icons.help_center,
        onTap: () => context.router.pushNamed(Routes.helperCenter),
      ),
      profileActionItem(
        context,
        title: l10n.inviteFriends,
        icon: Icons.group,
        onTap: () => context.router.pushNamed(Routes.friendsInvitation),
      ),
    ];
  }
}
