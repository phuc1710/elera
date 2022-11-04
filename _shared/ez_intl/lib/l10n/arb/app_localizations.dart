import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_vi.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'arb/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi')
  ];

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @aboutCourse.
  ///
  /// In en, this message translates to:
  /// **'About Course'**
  String get aboutCourse;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @alreadyHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAnAccount;

  /// No description provided for @calls.
  ///
  /// In en, this message translates to:
  /// **'Calls'**
  String get calls;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @certificate.
  ///
  /// In en, this message translates to:
  /// **'Certificate'**
  String get certificate;

  /// No description provided for @chats.
  ///
  /// In en, this message translates to:
  /// **'Chats'**
  String get chats;

  /// No description provided for @clearAll.
  ///
  /// In en, this message translates to:
  /// **'Clear All'**
  String get clearAll;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @confirmPaymentPrompt.
  ///
  /// In en, this message translates to:
  /// **'Enter your PIN to confirm payment'**
  String get confirmPaymentPrompt;

  /// No description provided for @congratulations.
  ///
  /// In en, this message translates to:
  /// **'Congratulations!'**
  String get congratulations;

  /// No description provided for @cont.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get cont;

  /// No description provided for @continueWithApple.
  ///
  /// In en, this message translates to:
  /// **'Continue with Apple'**
  String get continueWithApple;

  /// No description provided for @continueWithFacebook.
  ///
  /// In en, this message translates to:
  /// **'Continue with Facebook'**
  String get continueWithFacebook;

  /// No description provided for @continueWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get continueWithGoogle;

  /// No description provided for @courses.
  ///
  /// In en, this message translates to:
  /// **'Courses'**
  String get courses;

  /// No description provided for @createNewPIN.
  ///
  /// In en, this message translates to:
  /// **'Create new PIN'**
  String get createNewPIN;

  /// No description provided for @createNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Create New Password'**
  String get createNewPassword;

  /// No description provided for @createYourAccount.
  ///
  /// In en, this message translates to:
  /// **'Create your\nAccount'**
  String get createYourAccount;

  /// No description provided for @createYourNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Create Your New Password'**
  String get createYourNewPassword;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @dob.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get dob;

  /// No description provided for @dontHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAnAccount;

  /// No description provided for @eReceipt.
  ///
  /// In en, this message translates to:
  /// **'E-receipt'**
  String get eReceipt;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @enrollCourse.
  ///
  /// In en, this message translates to:
  /// **'Enroll Course'**
  String get enrollCourse;

  /// No description provided for @enrollCourseSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Enroll Course Successful!'**
  String get enrollCourseSuccessful;

  /// No description provided for @enrollSuccessDialogContent.
  ///
  /// In en, this message translates to:
  /// **'You have successfully made payment and enrolled the course.'**
  String get enrollSuccessDialogContent;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'f,Female'**
  String get female;

  /// No description provided for @fillYourProfile.
  ///
  /// In en, this message translates to:
  /// **'Fill Your Profile'**
  String get fillYourProfile;

  /// No description provided for @fingerprintCreationDescription1.
  ///
  /// In en, this message translates to:
  /// **'Add a fingerprint to make your account more secure'**
  String get fingerprintCreationDescription1;

  /// No description provided for @fingerprintCreationDescription2.
  ///
  /// In en, this message translates to:
  /// **'Please put your finger on the fingerprint scanner to get started'**
  String get fingerprintCreationDescription2;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgotPassword;

  /// No description provided for @forgotThePassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot the password?'**
  String get forgotThePassword;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @goodMorning.
  ///
  /// In en, this message translates to:
  /// **'Good Morning 👏'**
  String get goodMorning;

  /// No description provided for @helpCenter.
  ///
  /// In en, this message translates to:
  /// **'Help Center'**
  String get helpCenter;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @hours.
  ///
  /// In en, this message translates to:
  /// **'Hours'**
  String get hours;

  /// No description provided for @inbox.
  ///
  /// In en, this message translates to:
  /// **'Inbox'**
  String get inbox;

  /// No description provided for @inviteFriends.
  ///
  /// In en, this message translates to:
  /// **'Invite Friends'**
  String get inviteFriends;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @lessons.
  ///
  /// In en, this message translates to:
  /// **'lessons'**
  String get lessons;

  /// No description provided for @lessonsCap.
  ///
  /// In en, this message translates to:
  /// **'Lessons'**
  String get lessonsCap;

  /// No description provided for @letsYouIn.
  ///
  /// In en, this message translates to:
  /// **'Let\'s you in'**
  String get letsYouIn;

  /// No description provided for @logOut.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logOut;

  /// No description provided for @loginToYourAccount.
  ///
  /// In en, this message translates to:
  /// **'Login to your\nAccount'**
  String get loginToYourAccount;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'m,Male'**
  String get male;

  /// No description provided for @mentor.
  ///
  /// In en, this message translates to:
  /// **'Mentor'**
  String get mentor;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @mostPopularCourses.
  ///
  /// In en, this message translates to:
  /// **'Most Popular Courses'**
  String get mostPopularCourses;

  /// No description provided for @myBookmark.
  ///
  /// In en, this message translates to:
  /// **'My Bookmark'**
  String get myBookmark;

  /// No description provided for @myCourse.
  ///
  /// In en, this message translates to:
  /// **'My Course'**
  String get myCourse;

  /// No description provided for @myCourseNavBar.
  ///
  /// In en, this message translates to:
  /// **'My Course'**
  String get myCourseNavBar;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @nickname.
  ///
  /// In en, this message translates to:
  /// **'Nickname'**
  String get nickname;

  /// No description provided for @notification.
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get notification;

  /// No description provided for @onboarding1.
  ///
  /// In en, this message translates to:
  /// **'We provide the best learning courses & great mentors!'**
  String get onboarding1;

  /// No description provided for @onboarding2.
  ///
  /// In en, this message translates to:
  /// **'Learn anytime and anywhere easily and conveniently'**
  String get onboarding2;

  /// No description provided for @onboarding3.
  ///
  /// In en, this message translates to:
  /// **'Let\'s improve your skills together with Elera right now!'**
  String get onboarding3;

  /// No description provided for @ongoing.
  ///
  /// In en, this message translates to:
  /// **'Ongoing'**
  String get ongoing;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get or;

  /// No description provided for @orContinueWith.
  ///
  /// In en, this message translates to:
  /// **'or continue with'**
  String get orContinueWith;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get payment;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @pinCreationDescription.
  ///
  /// In en, this message translates to:
  /// **'Add a pin number to make your account more secure'**
  String get pinCreationDescription;

  /// No description provided for @pinEntryPrompt.
  ///
  /// In en, this message translates to:
  /// **'Code has been sent to'**
  String get pinEntryPrompt;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @readMore.
  ///
  /// In en, this message translates to:
  /// **'Read more ...'**
  String get readMore;

  /// No description provided for @recent.
  ///
  /// In en, this message translates to:
  /// **'Recent'**
  String get recent;

  /// No description provided for @rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember Me'**
  String get rememberMe;

  /// No description provided for @removeFromBookmark.
  ///
  /// In en, this message translates to:
  /// **'Remove from bookmark?'**
  String get removeFromBookmark;

  /// No description provided for @repeatPassword.
  ///
  /// In en, this message translates to:
  /// **'Repeat Password'**
  String get repeatPassword;

  /// No description provided for @resend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get resend;

  /// No description provided for @resendCodeIn.
  ///
  /// In en, this message translates to:
  /// **'Resend code in'**
  String get resendCodeIn;

  /// No description provided for @reviews.
  ///
  /// In en, this message translates to:
  /// **'reviews'**
  String get reviews;

  /// No description provided for @reviewsCap.
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get reviewsCap;

  /// No description provided for @s.
  ///
  /// In en, this message translates to:
  /// **'s'**
  String get s;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @security.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get security;

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get seeAll;

  /// No description provided for @selectContactDescription.
  ///
  /// In en, this message translates to:
  /// **'Select which contact detail should we use to reset your password'**
  String get selectContactDescription;

  /// No description provided for @setYourFingerprint.
  ///
  /// In en, this message translates to:
  /// **'Set Your Fingerprint'**
  String get setYourFingerprint;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signIn;

  /// No description provided for @signInWithPassword.
  ///
  /// In en, this message translates to:
  /// **'Sign in with password'**
  String get signInWithPassword;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUp;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @students.
  ///
  /// In en, this message translates to:
  /// **'students'**
  String get students;

  /// No description provided for @studentsCap.
  ///
  /// In en, this message translates to:
  /// **'Students'**
  String get studentsCap;

  /// No description provided for @suggested.
  ///
  /// In en, this message translates to:
  /// **'Suggested'**
  String get suggested;

  /// No description provided for @tools.
  ///
  /// In en, this message translates to:
  /// **'Tools'**
  String get tools;

  /// No description provided for @topMentors.
  ///
  /// In en, this message translates to:
  /// **'Top Mentors'**
  String get topMentors;

  /// No description provided for @transactions.
  ///
  /// In en, this message translates to:
  /// **'Transactions'**
  String get transactions;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @via.
  ///
  /// In en, this message translates to:
  /// **'via'**
  String get via;

  /// No description provided for @viewCourse.
  ///
  /// In en, this message translates to:
  /// **'View Course'**
  String get viewCourse;

  /// No description provided for @viewEReceipt.
  ///
  /// In en, this message translates to:
  /// **'View E-Receipt'**
  String get viewEReceipt;

  /// No description provided for @website.
  ///
  /// In en, this message translates to:
  /// **'Website'**
  String get website;

  /// No description provided for @welcomeDialogContent.
  ///
  /// In en, this message translates to:
  /// **'Your account is ready to use. You will be redirected to the Home page in a few seconds..'**
  String get welcomeDialogContent;

  /// No description provided for @yesRemove.
  ///
  /// In en, this message translates to:
  /// **'Yes, Remove'**
  String get yesRemove;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'vi': return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
