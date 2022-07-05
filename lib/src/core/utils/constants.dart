class AppStrings {
  static const String materialAppTitle = 'E-Learning';
}

List<String> recentSearchList = [
  'CRM Management',
  'Full-stack Web Developer',
  'Learn UX User Persona',
  '3D Blender and UI/UX',
  'Digital Entrepreneurship',
  '3D Icons Set Blender',
  'Flutter Mobile Apps',
  '3D Design Illustration'
];

class EndPoints {
  static const String baseUrl = '';
  static const String devUrl = '';

  static const String course = '/course';
  static const String helperCenter = '/helper_center';
  static const String profile = '/profile';
  static const String countries = '/countries';
  static const String payments = '/payments';
  static const String addNewCard = '/add_new_card';
  static const String languages = '/language';
}

class ErrorCode {
  static const int success = 1;
  static const int tokenExpired = -15;
}
