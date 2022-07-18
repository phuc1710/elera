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
  EndPoints.home: 'fetch_home',
  EndPoints.notification: 'fetch_notification'
};

final Map<String, String> mapMockApiForPostRequest = {
  EndPoints.signIn: 'sign_in',
  EndPoints.signUp: 'sign_up',
  EndPoints.fillYourProfile: 'fill_your_profile',
  EndPoints.createNewPin: 'create_new_pin',
  EndPoints.profile: 'profile',
  EndPoints.addNewCard: 'profile',
  EndPoints.inviteFriends: 'invite_friends',
  EndPoints.selectContact: 'select_contact',
  EndPoints.enterPin: 'enter_pin',
  EndPoints.createPassword: 'create_password',
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
