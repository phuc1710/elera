// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/nd_network/nd_network.dart' as _i4;
import '../data/datasources/local/cache/app_cache.dart' as _i3;
import '../data/datasources/remote/bookmark_api_service.dart' as _i15;
import '../data/datasources/remote/course_api_service.dart' as _i20;
import '../data/datasources/remote/e_receipt_api_service.dart' as _i25;
import '../data/datasources/remote/helper_api_service.dart' as _i34;
import '../data/datasources/remote/home_api_service.dart' as _i37;
import '../data/datasources/remote/inbox_api_service.dart' as _i40;
import '../data/datasources/remote/mentor_api_service.dart' as _i47;
import '../data/datasources/remote/notification_api_service.dart' as _i56;
import '../data/datasources/remote/search_api_service.dart' as _i67;
import '../data/datasources/remote/transactions_api_service.dart' as _i6;
import '../data/datasources/remote/user_api_service.dart' as _i9;
import '../data/repositories/bookmark_repository_impl.dart' as _i17;
import '../data/repositories/courses_repository_impl.dart' as _i22;
import '../data/repositories/e_receipt_repository_impl.dart' as _i27;
import '../data/repositories/helper_repository_impl.dart' as _i36;
import '../data/repositories/home_repository_impl.dart' as _i39;
import '../data/repositories/inbox_repository_impl.dart' as _i42;
import '../data/repositories/mentor_repository_impl.dart' as _i49;
import '../data/repositories/notification_repository_impl.dart' as _i58;
import '../data/repositories/search_repository_impl.dart' as _i69;
import '../data/repositories/transactions_repository_impl.dart' as _i8;
import '../data/repositories/user_repository_impl.dart' as _i11;
import '../domain/repositories/bookmark_repository.dart' as _i16;
import '../domain/repositories/course_repository.dart' as _i21;
import '../domain/repositories/e_receipt_repository.dart' as _i26;
import '../domain/repositories/helper_repository.dart' as _i35;
import '../domain/repositories/home_repository.dart' as _i38;
import '../domain/repositories/inbox_repository.dart' as _i41;
import '../domain/repositories/mentor_repository.dart' as _i48;
import '../domain/repositories/notification_repository.dart' as _i57;
import '../domain/repositories/search_repository.dart' as _i68;
import '../domain/repositories/transactions_repository.dart' as _i7;
import '../domain/repositories/user_repository.dart' as _i10;
import '../domain/usecases/access_token_save_usecase.dart' as _i12;
import '../domain/usecases/access_token_usecase.dart' as _i13;
import '../domain/usecases/add_new_card_usecase.dart' as _i14;
import '../domain/usecases/clear_cache_usecase.dart' as _i78;
import '../domain/usecases/create_new_pin_usecase.dart' as _i24;
import '../domain/usecases/fill_your_profile_usecase.dart' as _i28;
import '../domain/usecases/get_bookmark_fetch_usecase.dart' as _i75;
import '../domain/usecases/get_chat_fetch_usecase.dart' as _i77;
import '../domain/usecases/get_contact_fetch_usecase.dart' as _i18;
import '../domain/usecases/get_countries_usecase.dart' as _i90;
import '../domain/usecases/get_course_details_fetch_usecase.dart' as _i81;
import '../domain/usecases/get_course_fetch_usecase.dart' as _i82;
import '../domain/usecases/get_course_lessons_fetch_usecase.dart' as _i83;
import '../domain/usecases/get_course_reviews_fetch_usecase.dart' as _i23;
import '../domain/usecases/get_e_receipt_usecase.dart' as _i29;
import '../domain/usecases/get_helper_center_usecase.dart' as _i91;
import '../domain/usecases/get_home_fetch_usecase.dart' as _i94;
import '../domain/usecases/get_inbox_fetch_usecase.dart' as _i95;
import '../domain/usecases/get_invite_friends_usecase.dart' as _i30;
import '../domain/usecases/get_languages_usecase.dart' as _i92;
import '../domain/usecases/get_mentor_courses_fetch_usecase.dart' as _i98;
import '../domain/usecases/get_mentor_fetch_usecase.dart' as _i100;
import '../domain/usecases/get_mentor_reviews_fetch_usecase.dart' as _i50;
import '../domain/usecases/get_mentor_students_fetch_usecase.dart' as _i51;
import '../domain/usecases/get_my_course_detail_fetch_usecase.dart' as _i52;
import '../domain/usecases/get_my_course_fetch_usecase.dart' as _i53;
import '../domain/usecases/get_notification_fetch_usecase.dart' as _i103;
import '../domain/usecases/get_payments_usecase.dart' as _i31;
import '../domain/usecases/get_pin_sending_usecase.dart' as _i61;
import '../domain/usecases/get_profile_usecase.dart' as _i32;
import '../domain/usecases/get_recent_search_fetch_usecase.dart' as _i107;
import '../domain/usecases/get_search_fetch_usecase.dart' as _i109;
import '../domain/usecases/get_transactions_usecase.dart' as _i33;
import '../domain/usecases/invite_friend_usecase.dart' as _i43;
import '../domain/usecases/language_save_usecase.dart' as _i44;
import '../domain/usecases/language_usecase.dart' as _i45;
import '../domain/usecases/post_bookmark_addition_usecase.dart' as _i74;
import '../domain/usecases/post_bookmark_removal_usecase.dart' as _i76;
import '../domain/usecases/post_contact_selection_usecase.dart' as _i19;
import '../domain/usecases/post_enroll_course_usecase.dart' as _i63;
import '../domain/usecases/post_password_creation_usecase.dart' as _i59;
import '../domain/usecases/post_pin_validation_usecase.dart' as _i62;
import '../domain/usecases/post_recent_search_addition_usecase.dart' as _i106;
import '../domain/usecases/post_recent_search_removal_usecase.dart' as _i108;
import '../domain/usecases/post_update_lesson_time_usecase.dart' as _i64;
import '../domain/usecases/sign_in_usecase.dart' as _i70;
import '../domain/usecases/sign_up_usecase.dart' as _i71;
import '../domain/usecases/update_profile_usecase.dart' as _i73;
import '../module/register_module.dart' as _i122;
import '../presentation/_blocs/locale/locale_bloc.dart' as _i46;
import '../presentation/_blocs/theme/theme_bloc.dart' as _i5;
import '../presentation/account_setup/create_new_pin/bloc/create_new_pin_bloc.dart'
    as _i85;
import '../presentation/account_setup/fill_your_profile/bloc/fill_your_profile_bloc.dart'
    as _i88;
import '../presentation/course_detail_payment_enroll/confirm_payment/bloc/confirm_payment_bloc.dart'
    as _i79;
import '../presentation/course_detail_payment_enroll/course_details/bloc/course_details_bloc.dart'
    as _i116;
import '../presentation/course_detail_payment_enroll/course_video/bloc/course_video_bloc.dart'
    as _i84;
import '../presentation/course_detail_payment_enroll/enroll_course/bloc/enroll_course_bloc.dart'
    as _i87;
import '../presentation/course_detail_payment_enroll/lesson/bloc/lesson_bloc.dart'
    as _i97;
import '../presentation/course_detail_payment_enroll/mentor_profile/bloc/mentor_details_bloc.dart'
    as _i99;
import '../presentation/course_detail_payment_enroll/review/bloc/review_bloc.dart'
    as _i66;
import '../presentation/edit_profile/bloc/edit_profile_bloc.dart' as _i117;
import '../presentation/forgot_and_reset_password/create_new_password/bloc/password_creation_bloc.dart'
    as _i104;
import '../presentation/forgot_and_reset_password/enter_pin/bloc/pin_entry_bloc.dart'
    as _i105;
import '../presentation/forgot_and_reset_password/select_contact/bloc/contact_selection_bloc.dart'
    as _i80;
import '../presentation/friends_invitation/bloc/friends_invitation_bloc.dart'
    as _i89;
import '../presentation/help_center/bloc/helper_center_bloc.dart' as _i93;
import '../presentation/home_and_action_menu/home/bloc/home_bloc.dart' as _i118;
import '../presentation/home_and_action_menu/most_popular_courses/bloc/course_bloc.dart'
    as _i115;
import '../presentation/home_and_action_menu/my_bookmark/bloc/bookmark_bloc.dart'
    as _i113;
import '../presentation/home_and_action_menu/notification/bloc/notification_bloc.dart'
    as _i120;
import '../presentation/home_and_action_menu/search/bloc/search_bloc.dart'
    as _i121;
import '../presentation/home_and_action_menu/top_mentors/bloc/top_mentors_bloc.dart'
    as _i112;
import '../presentation/inbox_chats_and_calls/chat/bloc/chat_bloc.dart'
    as _i114;
import '../presentation/inbox_chats_and_calls/inbox/bloc/inbox_bloc.dart'
    as _i119;
import '../presentation/language/bloc/language_bloc.dart' as _i96;
import '../presentation/lets_in/sign_in/bloc/sign_in_bloc.dart' as _i110;
import '../presentation/lets_in/sign_up/bloc/sign_up_bloc.dart' as _i111;
import '../presentation/my_course/my_completed_course/bloc/my_complete_course_bloc.dart'
    as _i101;
import '../presentation/my_course/my_courses/bloc/my_course_bloc.dart' as _i102;
import '../presentation/my_course/my_ongoing_course/bloc/my_ongoing_course_bloc.dart'
    as _i54;
import '../presentation/new_card/bloc/new_card_bloc.dart' as _i55;
import '../presentation/payment/bloc/payment_bloc.dart' as _i60;
import '../presentation/profile/bloc/profile_bloc.dart' as _i65;
import '../presentation/transactions/bloc/transactions_bloc.dart' as _i72;
import '../presentation/transactions/e_receipt/bloc/e_receipt_bloc.dart'
    as _i86; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.AppCache>(() => registerModule.cache);
  gh.factory<_i4.Dio>(() => registerModule.apiDio, instanceName: 'ApiDio');
  gh.factory<String>(() => registerModule.apiBaseUrl,
      instanceName: 'ApiBaseUrl');
  gh.factory<_i5.ThemeBloc>(() => _i5.ThemeBloc());
  gh.lazySingleton<_i6.TransactionsApiService>(() =>
      registerModule.transactionsApiService(
          get<_i4.Dio>(instanceName: 'ApiDio'),
          get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i7.TransactionsRepository>(
      () => _i8.TransactionsRepositoryImpl(get<_i6.TransactionsApiService>()));
  gh.lazySingleton<_i9.UserApiService>(() => registerModule.userApiService(
      get<_i4.Dio>(instanceName: 'ApiDio'),
      get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i10.UserRepository>(() =>
      _i11.UserRepositoryImpl(get<_i3.AppCache>(), get<_i9.UserApiService>()));
  gh.factory<_i12.AccessTokenSaveUseCase>(
      () => _i12.AccessTokenSaveUseCase(get<_i10.UserRepository>()));
  gh.lazySingleton<_i13.AccessTokenUseCase>(
      () => _i13.AccessTokenUseCase(get<_i10.UserRepository>()));
  gh.factory<_i14.AddNewCardUseCase>(
      () => _i14.AddNewCardUseCase(get<_i10.UserRepository>()));
  gh.lazySingleton<_i15.BookmarkApiService>(() =>
      registerModule.bookmarkApiService(get<_i4.Dio>(instanceName: 'ApiDio'),
          get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i16.BookmarkRepository>(
      () => _i17.BookmarkRepositoryImpl(get<_i15.BookmarkApiService>()));
  gh.factory<_i18.ContactFetchUseCase>(
      () => _i18.ContactFetchUseCase(get<_i10.UserRepository>()));
  gh.factory<_i19.ContactSelectionUseCase>(
      () => _i19.ContactSelectionUseCase(get<_i10.UserRepository>()));
  gh.lazySingleton<_i20.CourseApiService>(() => registerModule.courseApiService(
      get<_i4.Dio>(instanceName: 'ApiDio'),
      get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i21.CourseRepository>(
      () => _i22.CourseRepositoryImpl(get<_i20.CourseApiService>()));
  gh.factory<_i23.CourseReviewsFetchUseCase>(
      () => _i23.CourseReviewsFetchUseCase(get<_i21.CourseRepository>()));
  gh.factory<_i24.CreateNewPinUseCase>(
      () => _i24.CreateNewPinUseCase(get<_i10.UserRepository>()));
  gh.lazySingleton<_i25.EReceiptApiService>(() =>
      registerModule.eReceiptApiService(get<_i4.Dio>(instanceName: 'ApiDio'),
          get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i26.EReceiptRepository>(
      () => _i27.EReceiptRepositoryImpl(get<_i25.EReceiptApiService>()));
  gh.factory<_i28.FillYourProfileUseCase>(
      () => _i28.FillYourProfileUseCase(get<_i10.UserRepository>()));
  gh.factory<_i29.GetEReceiptUseCase>(
      () => _i29.GetEReceiptUseCase(get<_i26.EReceiptRepository>()));
  gh.factory<_i30.GetInviteFriendsUseCase>(
      () => _i30.GetInviteFriendsUseCase(get<_i10.UserRepository>()));
  gh.factory<_i31.GetPaymentsUseCase>(
      () => _i31.GetPaymentsUseCase(get<_i10.UserRepository>()));
  gh.factory<_i32.GetProfileUseCase>(
      () => _i32.GetProfileUseCase(get<_i10.UserRepository>()));
  gh.factory<_i33.GetTransactionsUseCase>(
      () => _i33.GetTransactionsUseCase(get<_i7.TransactionsRepository>()));
  gh.lazySingleton<_i34.HelperApiService>(() => registerModule.helperApiService(
      get<_i4.Dio>(instanceName: 'ApiDio'),
      get<String>(instanceName: 'ApiBaseUrl')));
  gh.lazySingleton<_i35.HelperRepository>(() => _i36.HelperRepositoryImpl(
      get<_i3.AppCache>(), get<_i34.HelperApiService>()));
  gh.lazySingleton<_i37.HomeApiService>(() => registerModule.homeApiService(
      get<_i4.Dio>(instanceName: 'ApiDio'),
      get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i38.HomeRepository>(
      () => _i39.HomeRepositoryImpl(get<_i37.HomeApiService>()));
  gh.lazySingleton<_i40.InboxApiService>(() => registerModule.inboxApiService(
      get<_i4.Dio>(instanceName: 'ApiDio'),
      get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i41.InboxRepository>(
      () => _i42.InboxRepositoryImpl(get<_i40.InboxApiService>()));
  gh.factory<_i43.InviteFriendUseCase>(
      () => _i43.InviteFriendUseCase(get<_i10.UserRepository>()));
  gh.lazySingleton<_i44.LanguageSaveUseCase>(
      () => _i44.LanguageSaveUseCase(get<_i35.HelperRepository>()));
  gh.lazySingleton<_i45.LanguageUseCase>(
      () => _i45.LanguageUseCase(get<_i35.HelperRepository>()));
  gh.factory<_i46.LocaleBloc>(
      () => _i46.LocaleBloc(get<_i45.LanguageUseCase>()));
  gh.lazySingleton<_i47.MentorApiService>(() => registerModule.mentorApiService(
      get<_i4.Dio>(instanceName: 'ApiDio'),
      get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i48.MentorRepository>(
      () => _i49.MentorRepositoryImpl(get<_i47.MentorApiService>()));
  gh.factory<_i50.MentorReviewsFetchUseCase>(
      () => _i50.MentorReviewsFetchUseCase(get<_i48.MentorRepository>()));
  gh.factory<_i51.MentorStudentsFetchUseCase>(
      () => _i51.MentorStudentsFetchUseCase(get<_i48.MentorRepository>()));
  gh.factory<_i52.MyCourseDetailFetchUseCase>(
      () => _i52.MyCourseDetailFetchUseCase(get<_i10.UserRepository>()));
  gh.factory<_i53.MyCourseFetchUseCase>(
      () => _i53.MyCourseFetchUseCase(get<_i10.UserRepository>()));
  gh.factory<_i54.MyOngoingCourseBloc>(
      () => _i54.MyOngoingCourseBloc(get<_i52.MyCourseDetailFetchUseCase>()));
  gh.factory<_i55.NewCardBloc>(
      () => _i55.NewCardBloc(get<_i14.AddNewCardUseCase>()));
  gh.lazySingleton<_i56.NotificationApiService>(() =>
      registerModule.notificationApiService(
          get<_i4.Dio>(instanceName: 'ApiDio'),
          get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i57.NotificationRepository>(() =>
      _i58.NotificationRepositoryImpl(get<_i56.NotificationApiService>()));
  gh.factory<_i59.PasswordCreationUseCase>(
      () => _i59.PasswordCreationUseCase(get<_i10.UserRepository>()));
  gh.factory<_i60.PaymentBloc>(
      () => _i60.PaymentBloc(get<_i31.GetPaymentsUseCase>()));
  gh.factory<_i61.PinSendingUseCase>(
      () => _i61.PinSendingUseCase(get<_i10.UserRepository>()));
  gh.factory<_i62.PinValidationUseCase>(
      () => _i62.PinValidationUseCase(get<_i10.UserRepository>()));
  gh.factory<_i63.PostEnrollCourseUseCase>(
      () => _i63.PostEnrollCourseUseCase(get<_i21.CourseRepository>()));
  gh.factory<_i64.PostUpdateLessonTimeUseCase>(
      () => _i64.PostUpdateLessonTimeUseCase(get<_i21.CourseRepository>()));
  gh.factory<_i65.ProfileBloc>(() => _i65.ProfileBloc(
      get<_i32.GetProfileUseCase>(), get<_i45.LanguageUseCase>()));
  gh.factory<_i66.ReviewBloc>(
      () => _i66.ReviewBloc(get<_i23.CourseReviewsFetchUseCase>()));
  gh.lazySingleton<_i67.SearchApiService>(() => registerModule.searchApiService(
      get<_i4.Dio>(instanceName: 'ApiDio'),
      get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i68.SearchRepository>(
      () => _i69.SearchRepositoryImpl(get<_i67.SearchApiService>()));
  gh.factory<_i70.SignInUseCase>(
      () => _i70.SignInUseCase(get<_i10.UserRepository>()));
  gh.factory<_i71.SignUpUseCase>(
      () => _i71.SignUpUseCase(get<_i10.UserRepository>()));
  gh.factory<_i72.TransactionsBloc>(
      () => _i72.TransactionsBloc(get<_i33.GetTransactionsUseCase>()));
  gh.factory<_i73.UpdateProfileUseCase>(
      () => _i73.UpdateProfileUseCase(get<_i10.UserRepository>()));
  gh.factory<_i74.BookmarkAdditionUseCase>(
      () => _i74.BookmarkAdditionUseCase(get<_i16.BookmarkRepository>()));
  gh.factory<_i75.BookmarkFetchUseCase>(
      () => _i75.BookmarkFetchUseCase(get<_i16.BookmarkRepository>()));
  gh.factory<_i76.BookmarkRemovalUseCase>(
      () => _i76.BookmarkRemovalUseCase(get<_i16.BookmarkRepository>()));
  gh.factory<_i77.ChatFetchUseCase>(
      () => _i77.ChatFetchUseCase(get<_i41.InboxRepository>()));
  gh.factory<_i78.ClearCacheUseCase>(
      () => _i78.ClearCacheUseCase(get<_i35.HelperRepository>()));
  gh.factory<_i79.ConfirmPaymentBloc>(
      () => _i79.ConfirmPaymentBloc(get<_i62.PinValidationUseCase>()));
  gh.factory<_i80.ContactSelectionBloc>(() => _i80.ContactSelectionBloc(
      get<_i19.ContactSelectionUseCase>(), get<_i18.ContactFetchUseCase>()));
  gh.factory<_i81.CourseDetailsFetchUseCase>(
      () => _i81.CourseDetailsFetchUseCase(get<_i21.CourseRepository>()));
  gh.factory<_i82.CourseFetchUseCase>(
      () => _i82.CourseFetchUseCase(get<_i21.CourseRepository>()));
  gh.factory<_i83.CourseLessonsFetchUseCase>(
      () => _i83.CourseLessonsFetchUseCase(get<_i21.CourseRepository>()));
  gh.factory<_i84.CourseVideoBloc>(
      () => _i84.CourseVideoBloc(get<_i64.PostUpdateLessonTimeUseCase>()));
  gh.factory<_i85.CreateNewPinBloc>(
      () => _i85.CreateNewPinBloc(get<_i24.CreateNewPinUseCase>()));
  gh.factory<_i86.EReceiptBloc>(
      () => _i86.EReceiptBloc(get<_i29.GetEReceiptUseCase>()));
  gh.factory<_i87.EnrollCourseBloc>(() => _i87.EnrollCourseBloc(
      get<_i31.GetPaymentsUseCase>(), get<_i63.PostEnrollCourseUseCase>()));
  gh.factory<_i88.FillYourProfileBloc>(
      () => _i88.FillYourProfileBloc(get<_i28.FillYourProfileUseCase>()));
  gh.factory<_i89.FriendsInvitationBloc>(() => _i89.FriendsInvitationBloc(
      get<_i30.GetInviteFriendsUseCase>(), get<_i43.InviteFriendUseCase>()));
  gh.factory<_i90.GetCountriesUseCase>(
      () => _i90.GetCountriesUseCase(get<_i35.HelperRepository>()));
  gh.factory<_i91.GetHelperCenterUseCase>(
      () => _i91.GetHelperCenterUseCase(get<_i35.HelperRepository>()));
  gh.factory<_i92.GetLanguagesUseCase>(
      () => _i92.GetLanguagesUseCase(get<_i35.HelperRepository>()));
  gh.factory<_i93.HelperCenterBloc>(
      () => _i93.HelperCenterBloc(get<_i91.GetHelperCenterUseCase>()));
  gh.factory<_i94.HomeFetchUseCase>(
      () => _i94.HomeFetchUseCase(get<_i38.HomeRepository>()));
  gh.factory<_i95.InboxFetchUseCase>(
      () => _i95.InboxFetchUseCase(get<_i41.InboxRepository>()));
  gh.factory<_i96.LanguageBloc>(() => _i96.LanguageBloc(
      get<_i92.GetLanguagesUseCase>(), get<_i44.LanguageSaveUseCase>()));
  gh.factory<_i97.LessonBloc>(
      () => _i97.LessonBloc(get<_i83.CourseLessonsFetchUseCase>()));
  gh.factory<_i98.MentorCoursesFetchUseCase>(
      () => _i98.MentorCoursesFetchUseCase(get<_i48.MentorRepository>()));
  gh.factory<_i99.MentorDetailsBloc>(() => _i99.MentorDetailsBloc(
      get<_i98.MentorCoursesFetchUseCase>(),
      get<_i51.MentorStudentsFetchUseCase>(),
      get<_i50.MentorReviewsFetchUseCase>()));
  gh.factory<_i100.MentorFetchUseCase>(
      () => _i100.MentorFetchUseCase(get<_i48.MentorRepository>()));
  gh.factory<_i101.MyCompleteCourseBloc>(
      () => _i101.MyCompleteCourseBloc(get<_i52.MyCourseDetailFetchUseCase>()));
  gh.factory<_i102.MyCourseBloc>(
      () => _i102.MyCourseBloc(get<_i53.MyCourseFetchUseCase>()));
  gh.factory<_i103.NotificationFetchUseCase>(
      () => _i103.NotificationFetchUseCase(get<_i57.NotificationRepository>()));
  gh.factory<_i104.PasswordCreationBloc>(
      () => _i104.PasswordCreationBloc(get<_i59.PasswordCreationUseCase>()));
  gh.factory<_i105.PinEntryBloc>(() => _i105.PinEntryBloc(
      get<_i61.PinSendingUseCase>(), get<_i62.PinValidationUseCase>()));
  gh.factory<_i106.RecentSearchAdditionUseCase>(
      () => _i106.RecentSearchAdditionUseCase(get<_i68.SearchRepository>()));
  gh.factory<_i107.RecentSearchFetchUseCase>(
      () => _i107.RecentSearchFetchUseCase(get<_i68.SearchRepository>()));
  gh.factory<_i108.RecentSearchRemovalUseCase>(
      () => _i108.RecentSearchRemovalUseCase(get<_i68.SearchRepository>()));
  gh.factory<_i109.SearchFetchUseCase>(
      () => _i109.SearchFetchUseCase(get<_i68.SearchRepository>()));
  gh.factory<_i110.SignInBloc>(() => _i110.SignInBloc(
      get<_i70.SignInUseCase>(), get<_i12.AccessTokenSaveUseCase>()));
  gh.factory<_i111.SignUpBloc>(
      () => _i111.SignUpBloc(get<_i71.SignUpUseCase>()));
  gh.factory<_i112.TopMentorsBloc>(
      () => _i112.TopMentorsBloc(get<_i100.MentorFetchUseCase>()));
  gh.factory<_i113.BookmarkBloc>(() => _i113.BookmarkBloc(
      get<_i75.BookmarkFetchUseCase>(), get<_i76.BookmarkRemovalUseCase>()));
  gh.factory<_i114.ChatBloc>(
      () => _i114.ChatBloc(get<_i77.ChatFetchUseCase>()));
  gh.factory<_i115.CourseBloc>(() => _i115.CourseBloc(
      get<_i82.CourseFetchUseCase>(),
      get<_i74.BookmarkAdditionUseCase>(),
      get<_i76.BookmarkRemovalUseCase>()));
  gh.factory<_i116.CourseDetailsBloc>(() => _i116.CourseDetailsBloc(
      get<_i81.CourseDetailsFetchUseCase>(),
      get<_i83.CourseLessonsFetchUseCase>(),
      get<_i23.CourseReviewsFetchUseCase>()));
  gh.factory<_i117.EditProfileBloc>(() => _i117.EditProfileBloc(
      get<_i90.GetCountriesUseCase>(), get<_i73.UpdateProfileUseCase>()));
  gh.factory<_i118.HomeBloc>(() => _i118.HomeBloc(get<_i94.HomeFetchUseCase>(),
      get<_i74.BookmarkAdditionUseCase>(), get<_i76.BookmarkRemovalUseCase>()));
  gh.factory<_i119.InboxBloc>(
      () => _i119.InboxBloc(get<_i95.InboxFetchUseCase>()));
  gh.factory<_i120.NotificationBloc>(
      () => _i120.NotificationBloc(get<_i103.NotificationFetchUseCase>()));
  gh.factory<_i121.SearchBloc>(() => _i121.SearchBloc(
      get<_i109.SearchFetchUseCase>(),
      get<_i107.RecentSearchFetchUseCase>(),
      get<_i106.RecentSearchAdditionUseCase>(),
      get<_i108.RecentSearchRemovalUseCase>(),
      get<_i74.BookmarkAdditionUseCase>(),
      get<_i76.BookmarkRemovalUseCase>()));
  return get;
}

class _$RegisterModule extends _i122.RegisterModule {}
