import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/params/appbar_params.dart';
import '../../help_center/view/helper_center_page.dart';
import '../../widgets/base_appbar.dart';
import '../../widgets/logout_button.dart';
import '../bloc/profile_bloc.dart';
import '../widgets/profile_picture.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc()..add(ProfileStarted()),
      child: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopAppBar(
                AppBarParams(
                  context,
                  title: 'Profile',
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
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              buildUserDisplay(context),
              Divider(color: Colors.grey.withOpacity(0.8)),
              ...actions(context),
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
      onTap: onTap,
      title: Row(
        children: [
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.start,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.black),
            ),
          ),
          if (value != null)
            Expanded(
              child: Text(
                value,
                textAlign: TextAlign.end,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.black),
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
                    avatar: state.profile?.img,
                    callBack: () {},
                  ),
                  const SizedBox(height: 15),
                  Text(
                    state.profile?.fullname ?? '',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    state.profile?.email ?? '',
                    style: Theme.of(context).textTheme.displayLarge,
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
  List<Widget> actions(BuildContext context) => [
        profileActionItem(
          context,
          title: 'Edit Profile',
          icon: Icons.person,
          onTap: () {},
        ),
        profileActionItem(
          context,
          title: 'Notification',
          icon: Icons.notifications,
          onTap: () {},
        ),
        profileActionItem(
          context,
          title: 'Payment',
          icon: Icons.payment,
          onTap: () {},
        ),
        profileActionItem(
          context,
          title: 'Security',
          icon: Icons.security,
          onTap: () {},
        ),
        profileActionItem(
          context,
          title: 'Language',
          icon: Icons.language,
          value: 'English(US)',
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.dark_mode_outlined, size: 35),
          onTap: () {
            isDarkMode = !isDarkMode;
          },
          title: Text(
            'Dark Mode',
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.black),
          ),
          trailing: CupertinoSwitch(
            value: isDarkMode,
            onChanged: (value) {
              setState(() {
                isDarkMode = value;
              });
            },
          ),
        ),
        profileActionItem(
          context,
          title: 'Privacy Policy',
          icon: Icons.lock,
          onTap: () {},
        ),
        profileActionItem(
          context,
          title: 'Help Center',
          icon: Icons.help_center,
          onTap: () => pushScreen(context, const HelpeCenterPage()),
        ),
        profileActionItem(
          context,
          title: 'Invite Friends',
          icon: Icons.group,
          onTap: () {},
        ),
      ];

  Future<void> pushScreen(BuildContext context, Widget screen) async {
    return Navigator.of(context).push<dynamic>(
      MaterialPageRoute<dynamic>(
        builder: (context) => screen,
      ),
    );
  }
}
