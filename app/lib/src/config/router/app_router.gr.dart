// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    IntroRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const IntroView(),
      );
    },
    LetsInRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const LetsInView(),
      );
    },
    SignUpRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SignUpView(),
      );
    },
    SignInRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SignInView(),
      );
    },
    FillYourProfileRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const FillYourProfileView(),
      );
    },
    CreateNewPinRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const CreateNewPinView(),
      );
    },
    SetYourFingerprintRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SetYourFingerprintView(),
      );
    },
    SelectContactRoute.name: (routeData) {
      final args = routeData.argsAs<SelectContactRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: SelectContactView(
          key: args.key,
          email: args.email,
        ),
      );
    },
    EnterPinRoute.name: (routeData) {
      final args = routeData.argsAs<EnterPinRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: EnterPinView(
          key: args.key,
          contactInfo: args.contactInfo,
        ),
      );
    },
    CreateNewPasswordRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const CreateNewPasswordView(),
      );
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
    NotificationRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const NotificationView(),
      );
    },
    MyBookmarkRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const MyBookmarkView(),
      );
    },
    TopMentorsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const TopMentorsView(),
      );
    },
    MostPopularCoursesRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const MostPopularCoursesView(),
      );
    },
    SearchRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SearchView(),
      );
    },
    CourseDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CourseDetailsRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: CourseDetailsView(
          key: args.key,
          courseId: args.courseId,
        ),
      );
    },
    MentorProfileRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const MentorProfileView(),
      );
    },
    ReviewRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ReviewView(),
      );
    },
    LessonRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const LessonView(),
      );
    },
    EnrollCourseRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const EnrollCourseView(),
      );
    },
    ConfirmPaymentRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ConfirmPaymentView(),
      );
    },
    MyCompletedCourseRoute.name: (routeData) {
      final args = routeData.argsAs<MyCompletedCourseRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: MyCompletedCourseView(
          key: args.key,
          courseId: args.courseId,
          courseTitle: args.courseTitle,
        ),
      );
    },
    MyOngoingCourseRoute.name: (routeData) {
      final args = routeData.argsAs<MyOngoingCourseRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: MyOngoingCourseView(
          key: args.key,
          courseId: args.courseId,
          courseTitle: args.courseTitle,
        ),
      );
    },
    CourseVideoRoute.name: (routeData) {
      final args = routeData.argsAs<CourseVideoRouteArgs>(
          orElse: () => const CourseVideoRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: CourseVideoView(
          key: args.key,
          courseId: args.courseId,
          lessonId: args.lessonId,
          videoLink: args.videoLink,
          currentTime: args.currentTime,
        ),
      );
    },
    ChatRoute.name: (routeData) {
      final args =
          routeData.argsAs<ChatRouteArgs>(orElse: () => const ChatRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ChatView(
          key: args.key,
          username: args.username,
        ),
      );
    },
    CallRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const CallView(),
      );
    },
    EReceiptRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const EReceiptView(),
      );
    },
    EditProfileRoute.name: (routeData) {
      final args = routeData.argsAs<EditProfileRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: EditProfileView(
          key: args.key,
          profile: args.profile,
        ),
      );
    },
    NotificationSettingsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const NotificationSettingsView(),
      );
    },
    PaymentRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const PaymentView(),
      );
    },
    NewCardRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const NewCardView(),
      );
    },
    SecurityRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SecurityView(),
      );
    },
    LanguageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const LanguageView(),
      );
    },
    PrivacyPolicyRoute.name: (routeData) {
      final args = routeData.argsAs<PrivacyPolicyRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PrivacyPolicyView(
          key: args.key,
          url: args.url,
        ),
      );
    },
    FriendsInvitationRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const FriendsInvitationView(),
      );
    },
    HelperCenterRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HelperCenterView(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          IntroRoute.name,
          path: '/',
        ),
        RouteConfig(
          LetsInRoute.name,
          path: '/lets_in',
        ),
        RouteConfig(
          SignUpRoute.name,
          path: '/sign_up',
        ),
        RouteConfig(
          SignInRoute.name,
          path: '/sign_in',
        ),
        RouteConfig(
          FillYourProfileRoute.name,
          path: '/fill_your_profile',
        ),
        RouteConfig(
          CreateNewPinRoute.name,
          path: '/create_new_pin',
        ),
        RouteConfig(
          SetYourFingerprintRoute.name,
          path: '/set_your_fingerprint',
        ),
        RouteConfig(
          SelectContactRoute.name,
          path: '/select_contact',
        ),
        RouteConfig(
          EnterPinRoute.name,
          path: '/enter_pin',
        ),
        RouteConfig(
          CreateNewPasswordRoute.name,
          path: '/create_new_password',
        ),
        RouteConfig(
          HomeRoute.name,
          path: '/home',
        ),
        RouteConfig(
          NotificationRoute.name,
          path: '/notification',
        ),
        RouteConfig(
          MyBookmarkRoute.name,
          path: '/my_bookmark',
        ),
        RouteConfig(
          TopMentorsRoute.name,
          path: '/top_mentors',
        ),
        RouteConfig(
          MostPopularCoursesRoute.name,
          path: '/most_popular_courses',
        ),
        RouteConfig(
          SearchRoute.name,
          path: '/search',
        ),
        RouteConfig(
          CourseDetailsRoute.name,
          path: '/course_detail',
        ),
        RouteConfig(
          MentorProfileRoute.name,
          path: '/mentor_profile',
        ),
        RouteConfig(
          ReviewRoute.name,
          path: '/review',
        ),
        RouteConfig(
          LessonRoute.name,
          path: '/lesson',
        ),
        RouteConfig(
          EnrollCourseRoute.name,
          path: '/enroll_course',
        ),
        RouteConfig(
          ConfirmPaymentRoute.name,
          path: '/confirm_payment',
        ),
        RouteConfig(
          MyCompletedCourseRoute.name,
          path: '/my_completed_course',
        ),
        RouteConfig(
          MyOngoingCourseRoute.name,
          path: '/my_ongoing_course',
        ),
        RouteConfig(
          CourseVideoRoute.name,
          path: '/course_video',
        ),
        RouteConfig(
          ChatRoute.name,
          path: '/chat',
        ),
        RouteConfig(
          CallRoute.name,
          path: '/call',
        ),
        RouteConfig(
          EReceiptRoute.name,
          path: '/e_receipt',
        ),
        RouteConfig(
          EditProfileRoute.name,
          path: '/edit_profile',
        ),
        RouteConfig(
          NotificationSettingsRoute.name,
          path: '/notification_settings',
        ),
        RouteConfig(
          PaymentRoute.name,
          path: '/payment',
        ),
        RouteConfig(
          NewCardRoute.name,
          path: '/new_card',
        ),
        RouteConfig(
          SecurityRoute.name,
          path: '/security',
        ),
        RouteConfig(
          LanguageRoute.name,
          path: '/language',
        ),
        RouteConfig(
          PrivacyPolicyRoute.name,
          path: '/privacy_policy',
        ),
        RouteConfig(
          FriendsInvitationRoute.name,
          path: '/friend_invitation',
        ),
        RouteConfig(
          HelperCenterRoute.name,
          path: '/helper_center',
        ),
      ];
}

/// generated route for
/// [IntroView]
class IntroRoute extends PageRouteInfo<void> {
  const IntroRoute()
      : super(
          IntroRoute.name,
          path: '/',
        );

  static const String name = 'IntroRoute';
}

/// generated route for
/// [LetsInView]
class LetsInRoute extends PageRouteInfo<void> {
  const LetsInRoute()
      : super(
          LetsInRoute.name,
          path: '/lets_in',
        );

  static const String name = 'LetsInRoute';
}

/// generated route for
/// [SignUpView]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute()
      : super(
          SignUpRoute.name,
          path: '/sign_up',
        );

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [SignInView]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute()
      : super(
          SignInRoute.name,
          path: '/sign_in',
        );

  static const String name = 'SignInRoute';
}

/// generated route for
/// [FillYourProfileView]
class FillYourProfileRoute extends PageRouteInfo<void> {
  const FillYourProfileRoute()
      : super(
          FillYourProfileRoute.name,
          path: '/fill_your_profile',
        );

  static const String name = 'FillYourProfileRoute';
}

/// generated route for
/// [CreateNewPinView]
class CreateNewPinRoute extends PageRouteInfo<void> {
  const CreateNewPinRoute()
      : super(
          CreateNewPinRoute.name,
          path: '/create_new_pin',
        );

  static const String name = 'CreateNewPinRoute';
}

/// generated route for
/// [SetYourFingerprintView]
class SetYourFingerprintRoute extends PageRouteInfo<void> {
  const SetYourFingerprintRoute()
      : super(
          SetYourFingerprintRoute.name,
          path: '/set_your_fingerprint',
        );

  static const String name = 'SetYourFingerprintRoute';
}

/// generated route for
/// [SelectContactView]
class SelectContactRoute extends PageRouteInfo<SelectContactRouteArgs> {
  SelectContactRoute({
    Key? key,
    required String email,
  }) : super(
          SelectContactRoute.name,
          path: '/select_contact',
          args: SelectContactRouteArgs(
            key: key,
            email: email,
          ),
        );

  static const String name = 'SelectContactRoute';
}

class SelectContactRouteArgs {
  const SelectContactRouteArgs({
    this.key,
    required this.email,
  });

  final Key? key;

  final String email;

  @override
  String toString() {
    return 'SelectContactRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [EnterPinView]
class EnterPinRoute extends PageRouteInfo<EnterPinRouteArgs> {
  EnterPinRoute({
    Key? key,
    required dynamic contactInfo,
  }) : super(
          EnterPinRoute.name,
          path: '/enter_pin',
          args: EnterPinRouteArgs(
            key: key,
            contactInfo: contactInfo,
          ),
        );

  static const String name = 'EnterPinRoute';
}

class EnterPinRouteArgs {
  const EnterPinRouteArgs({
    this.key,
    required this.contactInfo,
  });

  final Key? key;

  final dynamic contactInfo;

  @override
  String toString() {
    return 'EnterPinRouteArgs{key: $key, contactInfo: $contactInfo}';
  }
}

/// generated route for
/// [CreateNewPasswordView]
class CreateNewPasswordRoute extends PageRouteInfo<void> {
  const CreateNewPasswordRoute()
      : super(
          CreateNewPasswordRoute.name,
          path: '/create_new_password',
        );

  static const String name = 'CreateNewPasswordRoute';
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [NotificationView]
class NotificationRoute extends PageRouteInfo<void> {
  const NotificationRoute()
      : super(
          NotificationRoute.name,
          path: '/notification',
        );

  static const String name = 'NotificationRoute';
}

/// generated route for
/// [MyBookmarkView]
class MyBookmarkRoute extends PageRouteInfo<void> {
  const MyBookmarkRoute()
      : super(
          MyBookmarkRoute.name,
          path: '/my_bookmark',
        );

  static const String name = 'MyBookmarkRoute';
}

/// generated route for
/// [TopMentorsView]
class TopMentorsRoute extends PageRouteInfo<void> {
  const TopMentorsRoute()
      : super(
          TopMentorsRoute.name,
          path: '/top_mentors',
        );

  static const String name = 'TopMentorsRoute';
}

/// generated route for
/// [MostPopularCoursesView]
class MostPopularCoursesRoute extends PageRouteInfo<void> {
  const MostPopularCoursesRoute()
      : super(
          MostPopularCoursesRoute.name,
          path: '/most_popular_courses',
        );

  static const String name = 'MostPopularCoursesRoute';
}

/// generated route for
/// [SearchView]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute()
      : super(
          SearchRoute.name,
          path: '/search',
        );

  static const String name = 'SearchRoute';
}

/// generated route for
/// [CourseDetailsView]
class CourseDetailsRoute extends PageRouteInfo<CourseDetailsRouteArgs> {
  CourseDetailsRoute({
    Key? key,
    required String courseId,
  }) : super(
          CourseDetailsRoute.name,
          path: '/course_detail',
          args: CourseDetailsRouteArgs(
            key: key,
            courseId: courseId,
          ),
        );

  static const String name = 'CourseDetailsRoute';
}

class CourseDetailsRouteArgs {
  const CourseDetailsRouteArgs({
    this.key,
    required this.courseId,
  });

  final Key? key;

  final String courseId;

  @override
  String toString() {
    return 'CourseDetailsRouteArgs{key: $key, courseId: $courseId}';
  }
}

/// generated route for
/// [MentorProfileView]
class MentorProfileRoute extends PageRouteInfo<void> {
  const MentorProfileRoute()
      : super(
          MentorProfileRoute.name,
          path: '/mentor_profile',
        );

  static const String name = 'MentorProfileRoute';
}

/// generated route for
/// [ReviewView]
class ReviewRoute extends PageRouteInfo<void> {
  const ReviewRoute()
      : super(
          ReviewRoute.name,
          path: '/review',
        );

  static const String name = 'ReviewRoute';
}

/// generated route for
/// [LessonView]
class LessonRoute extends PageRouteInfo<void> {
  const LessonRoute()
      : super(
          LessonRoute.name,
          path: '/lesson',
        );

  static const String name = 'LessonRoute';
}

/// generated route for
/// [EnrollCourseView]
class EnrollCourseRoute extends PageRouteInfo<void> {
  const EnrollCourseRoute()
      : super(
          EnrollCourseRoute.name,
          path: '/enroll_course',
        );

  static const String name = 'EnrollCourseRoute';
}

/// generated route for
/// [ConfirmPaymentView]
class ConfirmPaymentRoute extends PageRouteInfo<void> {
  const ConfirmPaymentRoute()
      : super(
          ConfirmPaymentRoute.name,
          path: '/confirm_payment',
        );

  static const String name = 'ConfirmPaymentRoute';
}

/// generated route for
/// [MyCompletedCourseView]
class MyCompletedCourseRoute extends PageRouteInfo<MyCompletedCourseRouteArgs> {
  MyCompletedCourseRoute({
    Key? key,
    required String courseId,
    required String courseTitle,
  }) : super(
          MyCompletedCourseRoute.name,
          path: '/my_completed_course',
          args: MyCompletedCourseRouteArgs(
            key: key,
            courseId: courseId,
            courseTitle: courseTitle,
          ),
        );

  static const String name = 'MyCompletedCourseRoute';
}

class MyCompletedCourseRouteArgs {
  const MyCompletedCourseRouteArgs({
    this.key,
    required this.courseId,
    required this.courseTitle,
  });

  final Key? key;

  final String courseId;

  final String courseTitle;

  @override
  String toString() {
    return 'MyCompletedCourseRouteArgs{key: $key, courseId: $courseId, courseTitle: $courseTitle}';
  }
}

/// generated route for
/// [MyOngoingCourseView]
class MyOngoingCourseRoute extends PageRouteInfo<MyOngoingCourseRouteArgs> {
  MyOngoingCourseRoute({
    Key? key,
    required String courseId,
    required String courseTitle,
  }) : super(
          MyOngoingCourseRoute.name,
          path: '/my_ongoing_course',
          args: MyOngoingCourseRouteArgs(
            key: key,
            courseId: courseId,
            courseTitle: courseTitle,
          ),
        );

  static const String name = 'MyOngoingCourseRoute';
}

class MyOngoingCourseRouteArgs {
  const MyOngoingCourseRouteArgs({
    this.key,
    required this.courseId,
    required this.courseTitle,
  });

  final Key? key;

  final String courseId;

  final String courseTitle;

  @override
  String toString() {
    return 'MyOngoingCourseRouteArgs{key: $key, courseId: $courseId, courseTitle: $courseTitle}';
  }
}

/// generated route for
/// [CourseVideoView]
class CourseVideoRoute extends PageRouteInfo<CourseVideoRouteArgs> {
  CourseVideoRoute({
    Key? key,
    String? courseId,
    String? lessonId,
    String? videoLink,
    int? currentTime,
  }) : super(
          CourseVideoRoute.name,
          path: '/course_video',
          args: CourseVideoRouteArgs(
            key: key,
            courseId: courseId,
            lessonId: lessonId,
            videoLink: videoLink,
            currentTime: currentTime,
          ),
        );

  static const String name = 'CourseVideoRoute';
}

class CourseVideoRouteArgs {
  const CourseVideoRouteArgs({
    this.key,
    this.courseId,
    this.lessonId,
    this.videoLink,
    this.currentTime,
  });

  final Key? key;

  final String? courseId;

  final String? lessonId;

  final String? videoLink;

  final int? currentTime;

  @override
  String toString() {
    return 'CourseVideoRouteArgs{key: $key, courseId: $courseId, lessonId: $lessonId, videoLink: $videoLink, currentTime: $currentTime}';
  }
}

/// generated route for
/// [ChatView]
class ChatRoute extends PageRouteInfo<ChatRouteArgs> {
  ChatRoute({
    Key? key,
    String? username,
  }) : super(
          ChatRoute.name,
          path: '/chat',
          args: ChatRouteArgs(
            key: key,
            username: username,
          ),
        );

  static const String name = 'ChatRoute';
}

class ChatRouteArgs {
  const ChatRouteArgs({
    this.key,
    this.username,
  });

  final Key? key;

  final String? username;

  @override
  String toString() {
    return 'ChatRouteArgs{key: $key, username: $username}';
  }
}

/// generated route for
/// [CallView]
class CallRoute extends PageRouteInfo<void> {
  const CallRoute()
      : super(
          CallRoute.name,
          path: '/call',
        );

  static const String name = 'CallRoute';
}

/// generated route for
/// [EReceiptView]
class EReceiptRoute extends PageRouteInfo<void> {
  const EReceiptRoute()
      : super(
          EReceiptRoute.name,
          path: '/e_receipt',
        );

  static const String name = 'EReceiptRoute';
}

/// generated route for
/// [EditProfileView]
class EditProfileRoute extends PageRouteInfo<EditProfileRouteArgs> {
  EditProfileRoute({
    Key? key,
    required ProfileModel? profile,
  }) : super(
          EditProfileRoute.name,
          path: '/edit_profile',
          args: EditProfileRouteArgs(
            key: key,
            profile: profile,
          ),
        );

  static const String name = 'EditProfileRoute';
}

class EditProfileRouteArgs {
  const EditProfileRouteArgs({
    this.key,
    required this.profile,
  });

  final Key? key;

  final ProfileModel? profile;

  @override
  String toString() {
    return 'EditProfileRouteArgs{key: $key, profile: $profile}';
  }
}

/// generated route for
/// [NotificationSettingsView]
class NotificationSettingsRoute extends PageRouteInfo<void> {
  const NotificationSettingsRoute()
      : super(
          NotificationSettingsRoute.name,
          path: '/notification_settings',
        );

  static const String name = 'NotificationSettingsRoute';
}

/// generated route for
/// [PaymentView]
class PaymentRoute extends PageRouteInfo<void> {
  const PaymentRoute()
      : super(
          PaymentRoute.name,
          path: '/payment',
        );

  static const String name = 'PaymentRoute';
}

/// generated route for
/// [NewCardView]
class NewCardRoute extends PageRouteInfo<void> {
  const NewCardRoute()
      : super(
          NewCardRoute.name,
          path: '/new_card',
        );

  static const String name = 'NewCardRoute';
}

/// generated route for
/// [SecurityView]
class SecurityRoute extends PageRouteInfo<void> {
  const SecurityRoute()
      : super(
          SecurityRoute.name,
          path: '/security',
        );

  static const String name = 'SecurityRoute';
}

/// generated route for
/// [LanguageView]
class LanguageRoute extends PageRouteInfo<void> {
  const LanguageRoute()
      : super(
          LanguageRoute.name,
          path: '/language',
        );

  static const String name = 'LanguageRoute';
}

/// generated route for
/// [PrivacyPolicyView]
class PrivacyPolicyRoute extends PageRouteInfo<PrivacyPolicyRouteArgs> {
  PrivacyPolicyRoute({
    Key? key,
    required String? url,
  }) : super(
          PrivacyPolicyRoute.name,
          path: '/privacy_policy',
          args: PrivacyPolicyRouteArgs(
            key: key,
            url: url,
          ),
        );

  static const String name = 'PrivacyPolicyRoute';
}

class PrivacyPolicyRouteArgs {
  const PrivacyPolicyRouteArgs({
    this.key,
    required this.url,
  });

  final Key? key;

  final String? url;

  @override
  String toString() {
    return 'PrivacyPolicyRouteArgs{key: $key, url: $url}';
  }
}

/// generated route for
/// [FriendsInvitationView]
class FriendsInvitationRoute extends PageRouteInfo<void> {
  const FriendsInvitationRoute()
      : super(
          FriendsInvitationRoute.name,
          path: '/friend_invitation',
        );

  static const String name = 'FriendsInvitationRoute';
}

/// generated route for
/// [HelperCenterView]
class HelperCenterRoute extends PageRouteInfo<void> {
  const HelperCenterRoute()
      : super(
          HelperCenterRoute.name,
          path: '/helper_center',
        );

  static const String name = 'HelperCenterRoute';
}
