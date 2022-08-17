// Project imports:
import '../network/end_points.dart';

final Map<String, String> mapMockApiForGetRequest = {
  EndPoints.payments: 'payment',
  EndPoints.helperCenter: 'helper_center',
  EndPoints.profile: 'profile',
  EndPoints.countries: 'edit_profile',
  EndPoints.languages: 'languages',
  EndPoints.inviteFriends: 'invite_friends',
  EndPoints.fetchContact: 'fetch_contact',
  EndPoints.pinSending: 'pin_sending',
  EndPoints.course: 'fetch_course',
  EndPoints.home: 'fetch_home',
  EndPoints.notification: 'fetch_notification',
  EndPoints.bookmark: 'fetch_bookmark',
  EndPoints.mentor: 'fetch_mentor',
  EndPoints.recentSearch: 'fetch_recent_search',
  EndPoints.search: 'fetch_search',
  EndPoints.transactions :'transactions'
};

final Map<String, String> mapMockApiForPostRequest = {
  EndPoints.signIn: 'sign_in',
  EndPoints.signUp: 'sign_up',
  EndPoints.fillYourProfile: 'fill_your_profile',
  EndPoints.createNewPin: 'create_new_pin',
  EndPoints.profile: 'profile',
  EndPoints.payments: 'profile',
  EndPoints.inviteFriends: 'invite_friends',
  EndPoints.selectContact: 'select_contact',
  EndPoints.enterPin: 'enter_pin',
  EndPoints.createPassword: 'create_password',
  EndPoints.addBookmark: 'add_bookmark',
  EndPoints.removeBookmark: 'remove_bookmark',
  EndPoints.addRecentSearch: 'add_bookmark',
  EndPoints.removeRecentSearch: 'remove_bookmark'
};

String? getJsonNameForGetRequest(
  String endpoint, {
  Map<String, dynamic>? queryParameters,
}) {
  return mapMockApiForGetRequest[endpoint];
}

String? getJsonNameForPostRequest(
  String endpoint, {
  dynamic data,
  Map<String, dynamic>? queryParameters,
}) {
  return mapMockApiForPostRequest[endpoint];
}
