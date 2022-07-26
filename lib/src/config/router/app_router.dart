import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/models/profile/profile_response_model.dart';
import '../../presentation/account_setup/create_new_pin/views/create_new_pin.dart';
import '../../presentation/account_setup/fill_your_profile/views/fill_your_profile.dart';
import '../../presentation/account_setup/set_your_fingerprint/views/set_your_fingerprint.dart';
import '../../presentation/edit_profile/view/edit_profile_page.dart';
import '../../presentation/forgot_and_reset_password/create_new_password/views/create_new_password_view.dart';
import '../../presentation/forgot_and_reset_password/enter_pin/views/enter_pin_view.dart';
import '../../presentation/forgot_and_reset_password/select_contact/views/select_contact_view.dart';
import '../../presentation/friends_invitation/view/friends_invitation_view.dart';
import '../../presentation/help_center/view/helper_center_view.dart';
import '../../presentation/home_and_action_menu/home/views/home_view.dart';
import '../../presentation/home_and_action_menu/most_popular_courses/views/most_popular_courses_view.dart';
import '../../presentation/home_and_action_menu/my_bookmark/views/my_bookmark_view.dart';
import '../../presentation/home_and_action_menu/notification/views/notification_view.dart';
import '../../presentation/home_and_action_menu/search/views/search_view.dart';
import '../../presentation/home_and_action_menu/top_mentors/views/top_mentors_view.dart';
import '../../presentation/language/view/language_view.dart';
import '../../presentation/letsin/letsin/views/letsin_view.dart';
import '../../presentation/letsin/signin/views/signin_view.dart';
import '../../presentation/letsin/signup/views/signup_view.dart';
import '../../presentation/new_card/view/new_card_view.dart';
import '../../presentation/notification_settings/view/notification_settings_view.dart';
import '../../presentation/onboarding/intro/views/intro_view.dart';
import '../../presentation/payment/view/payment_view.dart';
import '../../presentation/privacy_policy/privacy_policy_view.dart';
import '../../presentation/security/view/security_view.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    // 1. Onboarding
    AutoRoute<dynamic>(page: IntroView, initial: true, path: '/'),
    // 2. Let's in (Sign up, Sign in)
    AutoRoute<dynamic>(page: LetsInView, path: '/lets_in'),
    AutoRoute<dynamic>(page: SignUpView, path: '/sign_up'),
    AutoRoute<dynamic>(page: SignInView, path: '/sign_in'),
    // 3. Account Setup
    AutoRoute<dynamic>(page: FillYourProfileView, path: '/fill_your_profile'),
    AutoRoute<dynamic>(page: CreateNewPinView, path: '/create_new_pin'),
    AutoRoute<dynamic>(
      page: SetYourFingerprintView,
      path: '/set_your_fingerprint',
    ),
    // 4. Forgot & Reset Password
    AutoRoute<dynamic>(page: SelectContactView, path: '/select_contact'),
    AutoRoute<dynamic>(page: EnterPinView, path: '/enter_pin'),
    AutoRoute<dynamic>(
      page: CreateNewPasswordView,
      path: '/create_new_password',
    ),
    // 5. Home & Action Menu
    AutoRoute<dynamic>(page: HomeView, path: '/home'),
    AutoRoute<dynamic>(page: NotificationView, path: '/notification'),
    AutoRoute<dynamic>(page: MyBookmarkView, path: '/my_bookmark'),
    AutoRoute<dynamic>(page: TopMentorsView, path: '/top_mentors'),
    AutoRoute<dynamic>(
      page: MostPopularCoursesView,
      path: '/most_popular_courses',
    ),
    AutoRoute<dynamic>(page: SearchView, path: '/search'),
    // 10. Profile & Settings
    AutoRoute<dynamic>(page: EditProfileView, path: '/edit_profile'),
    AutoRoute<dynamic>(
      page: NotificationSettingsView,
      path: '/notification_setting',
    ),
    AutoRoute<dynamic>(page: PaymentView, path: '/payment'),
    AutoRoute<dynamic>(page: NewCardView, path: '/new_card'),
    AutoRoute<dynamic>(page: SecurityView, path: '/security'),
    AutoRoute<dynamic>(page: LanguageView, path: '/language'),
    AutoRoute<dynamic>(page: PrivacyPolicyView, path: '/privacy_policy'),
    AutoRoute<dynamic>(page: FriendsInvitationView, path: '/friend_invitation'),
    AutoRoute<dynamic>(page: HelperCenterView, path: '/helper_center'),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
