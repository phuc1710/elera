// ignore: avoid_classes_with_only_static_members
class EndPoints {
  EndPoints._();

  static const String baseUrl = 'http://103.63.215.140:7412/api/';
  static const String devUrl = '';
  static const String signIn = '/users/login';
  static const String signUp = '/sign_up';

  static const String fillYourProfile = '/fill_your_profile';
  static const String createNewPin = '/create_new_pin';

  static const String fetchContact = '/fetch_contact';
  static const String selectContact = '/select_contact';
  static const String pinSending = '/pin_sending';
  static const String enterPin = '/enter_pin';
  static const String createPassword = '/create_password';

  static const String course = '/fetch_course';
  static const String home = '/fetch_home';
  static const String notification = 'fetch_notification';

  static const String helperCenter = '/helper_center';
  static const String profile = '/profile';
  static const String countries = '/countries';
  static const String payments = '/payments';
  static const String addNewCard = '/add_new_card';
  static const String languages = '/language';
  static const String inviteFriends = '/invite_friends';
}
