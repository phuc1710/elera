import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/models/profile/profile_response_model.dart';
import '../../presentation/account_setup/create_new_pin/views/create_new_pin.dart';
import '../../presentation/account_setup/fill_your_profile/views/fill_your_profile.dart';
import '../../presentation/account_setup/set_your_fingerprint/views/set_your_fingerprint_view.dart';
import '../../presentation/course_detail_payment_enroll/confirm_payment/view/confirm_payment_view.dart';
import '../../presentation/course_detail_payment_enroll/course_detail/view/course_detail_view.dart';
import '../../presentation/course_detail_payment_enroll/course_video/view/course_video_view.dart';
import '../../presentation/course_detail_payment_enroll/enroll_course/view/enroll_course_view.dart';
import '../../presentation/course_detail_payment_enroll/lesson/view/lesson_view.dart';
import '../../presentation/course_detail_payment_enroll/mentor_profile/view/mentor_profile_view.dart';
import '../../presentation/course_detail_payment_enroll/review/view/review_view.dart';
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
import '../../presentation/inbox_chats_and_calls/call/view/call_view.dart';
import '../../presentation/inbox_chats_and_calls/chat/view/chat_view.dart';
import '../../presentation/language/view/language_view.dart';
import '../../presentation/letsin/letsin/views/letsin_view.dart';
import '../../presentation/letsin/signin/views/signin_view.dart';
import '../../presentation/letsin/signup/views/signup_view.dart';
import '../../presentation/my_course/my_completed_course/view/my_completed_course_view.dart';
import '../../presentation/my_course/my_ongoing_course/view/my_ongoing_course_view.dart';
import '../../presentation/new_card/view/new_card_view.dart';
import '../../presentation/notification_settings/view/notification_settings_view.dart';
import '../../presentation/onboarding/intro/views/intro_view.dart';
import '../../presentation/payment/view/payment_view.dart';
import '../../presentation/privacy_policy/privacy_policy_view.dart';
import '../../presentation/security/view/security_view.dart';
import '../../presentation/transactions/e_receipt/view/e_receipt_view.dart';
import 'routes.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    // 1. Onboarding
    AutoRoute<dynamic>(page: IntroView, path: Routes.intro, initial: true),
    // 2. Let's in (Sign up, Sign in)
    AutoRoute<dynamic>(page: LetsInView, path: Routes.letsIn),
    AutoRoute<dynamic>(page: SignUpView, path: Routes.signUp),
    AutoRoute<dynamic>(page: SignInView, path: Routes.signIn),
    // 3. Account Setup
    AutoRoute<dynamic>(
      page: FillYourProfileView,
      path: Routes.fillYourProfile,
    ),
    AutoRoute<dynamic>(page: CreateNewPinView, path: Routes.createNewPin),
    AutoRoute<dynamic>(
      page: SetYourFingerprintView,
      path: Routes.setYourFingerprint,
    ),
    // 4. Forgot & Reset Password
    AutoRoute<dynamic>(
      page: SelectContactView,
      path: Routes.selectContact,
    ),
    AutoRoute<dynamic>(page: EnterPinView, path: Routes.enterPin),
    AutoRoute<dynamic>(
      page: CreateNewPasswordView,
      path: Routes.createNewPassword,
    ),
    // 5. Home & Action Menu
    AutoRoute<dynamic>(page: HomeView, path: Routes.home),
    AutoRoute<dynamic>(page: NotificationView, path: Routes.notification),
    AutoRoute<dynamic>(page: MyBookmarkView, path: Routes.myBookmark),
    AutoRoute<dynamic>(page: TopMentorsView, path: Routes.topMentors),
    AutoRoute<dynamic>(
      page: MostPopularCoursesView,
      path: Routes.mostPopularCourses,
    ),
    AutoRoute<dynamic>(page: SearchView, path: Routes.searchRoute),
    // 6. Course Details & Payment/Enroll
    AutoRoute<dynamic>(page: CourseDetailsView, path: Routes.courseDetails),
    AutoRoute<dynamic>(page: MentorProfileView, path: Routes.mentorProfile),
    AutoRoute<dynamic>(page: ReviewView, path: Routes.review),
    AutoRoute<dynamic>(page: LessonView, path: Routes.lesson),
    AutoRoute<dynamic>(page: EnrollCourseView, path: Routes.enrollCourse),
    AutoRoute<dynamic>(page: ConfirmPaymentView, path: Routes.confirmPayment),
    // 7. My Course
    AutoRoute<dynamic>(
      page: MyCompletedCourseView,
      path: Routes.myCompletedCourse,
    ),
    AutoRoute<dynamic>(
      page: MyOngoingCourseView,
      path: Routes.myOngoingCourse,
    ),
    AutoRoute<dynamic>(page: CourseVideoView, path: Routes.courseVideo),
    // 8. Inbox/Messenger (Chats & Calls)
    AutoRoute<dynamic>(page: ChatView, path: Routes.chat),
    AutoRoute<dynamic>(page: CallView, path: Routes.call),
    // 9. Transactions
    AutoRoute<dynamic>(page: EReceiptView, path: Routes.eReceipt),
    // 10. Profile & Settings
    AutoRoute<dynamic>(page: EditProfileView, path: Routes.editProfile),
    AutoRoute<dynamic>(
      page: NotificationSettingsView,
      path: Routes.notificationSettings,
    ),
    AutoRoute<dynamic>(page: PaymentView, path: Routes.payment),
    AutoRoute<dynamic>(page: NewCardView, path: Routes.newCard),
    AutoRoute<dynamic>(page: SecurityView, path: Routes.security),
    AutoRoute<dynamic>(page: LanguageView, path: Routes.language),
    AutoRoute<dynamic>(
      page: PrivacyPolicyView,
      path: Routes.privacyPolicy,
    ),
    AutoRoute<dynamic>(
      page: FriendsInvitationView,
      path: Routes.friendsInvitation,
    ),
    AutoRoute<dynamic>(page: HelperCenterView, path: Routes.helperCenter),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
