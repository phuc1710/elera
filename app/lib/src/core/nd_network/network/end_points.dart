// ignore: avoid_classes_with_only_static_members
class EndPoints {
  EndPoints._();

  static const String baseUrl = 'http://103.63.215.141:7412/api';
  static const String devUrl = '';
  static const String signIn = '/users/login';
  static const String signUp = '/users/sign-up';

  static const String fillYourProfile = '/fill_your_profile';
  static const String createNewPin = '/create_new_pin';

  static const String fetchContact = '/fetch_contact';
  static const String selectContact = '/select_contact';
  static const String pinSending = '/pin_sending';
  static const String enterPin = '/enter_pin';
  static const String createPassword = '/create_password';

  static const String course = '/course';
  static const String home = '/fetch_home';
  static const String notification = '/fetch_notification';
  static const String bookmark = '/fetch_bookmark';
  static const String addBookmark = '/add_bookmark';
  static const String removeBookmark = '/remove_bookmark';
  static const String mentor = '/mentor';
  static const String recentSearch = '/recent_search';
  static const String addRecentSearch = '/add_recent_search';
  static const String removeRecentSearch = '/remove_recent_search';
  static const String search = '/search';

  static const String courseDetails = '/course_details';
  static const String courseLessons = '/course_lessons';
  static const String courseReviews = '${EndPoints.course}/review';
  static const String mentorCourses = '${EndPoints.mentor}/course';
  static const String mentorStudents = '${EndPoints.mentor}/student';
  static const String mentorReviews = '${EndPoints.mentor}/review';

  static const String transactions = '/transaction';
  static const String eReceipt = '${EndPoints.transactions}/e-receipt';

  static const String helperCenter = '/support';
  static const String profile = '/users/profile';
  static const String updateProfile = '${EndPoints.profile}/{id}';
  static const String countries = '/support/country';
  static const String payments = '/payment-method';
  static const String languages = '/language';
  static const String inviteFriends = '/invite_friends';
}
