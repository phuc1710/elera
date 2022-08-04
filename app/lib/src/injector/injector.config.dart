// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/nd_network/nd_network.dart' as _i4;
import '../data/datasources/local/cache/app_cache.dart' as _i3;
import '../data/datasources/remote/bookmark_api_service.dart' as _i12;
import '../data/datasources/remote/course_api_service.dart' as _i17;
import '../data/datasources/remote/helper_api_service.dart' as _i25;
import '../data/datasources/remote/home_api_service.dart' as _i28;
import '../data/datasources/remote/mentor_api_service.dart' as _i35;
import '../data/datasources/remote/notification_api_service.dart' as _i39;
import '../data/datasources/remote/search_api_service.dart' as _i47;
import '../data/datasources/remote/user_api_service.dart' as _i6;
import '../data/repositories/bookmark_repository_impl.dart' as _i14;
import '../data/repositories/courses_repository_impl.dart' as _i19;
import '../data/repositories/helper_repository_impl.dart' as _i27;
import '../data/repositories/home_repository_impl.dart' as _i30;
import '../data/repositories/mentor_repository_impl.dart' as _i37;
import '../data/repositories/notification_repository_impl.dart' as _i41;
import '../data/repositories/search_repository_impl.dart' as _i49;
import '../data/repositories/user_repository_impl.dart' as _i8;
import '../domain/repositories/bookmark_repository.dart' as _i13;
import '../domain/repositories/course_repository.dart' as _i18;
import '../domain/repositories/helper_repository.dart' as _i26;
import '../domain/repositories/home_repository.dart' as _i29;
import '../domain/repositories/mentor_repository.dart' as _i36;
import '../domain/repositories/notification_repository.dart' as _i40;
import '../domain/repositories/search_repository.dart' as _i48;
import '../domain/repositories/user_repository.dart' as _i7;
import '../domain/usecases/access_token_save_usecase.dart' as _i9;
import '../domain/usecases/access_token_usecase.dart' as _i10;
import '../domain/usecases/add_new_card_usecase.dart' as _i11;
import '../domain/usecases/clear_cache_usecase.dart' as _i56;
import '../domain/usecases/create_new_pin_usecase.dart' as _i20;
import '../domain/usecases/fill_your_profile_usecase.dart' as _i21;
import '../domain/usecases/get_bookmark_fetch_usecase.dart' as _i54;
import '../domain/usecases/get_contact_fetch_usecase.dart' as _i15;
import '../domain/usecases/get_countries_usecase.dart' as _i62;
import '../domain/usecases/get_course_fetch_usecase.dart' as _i58;
import '../domain/usecases/get_helper_center_usecase.dart' as _i63;
import '../domain/usecases/get_home_fetch_usecase.dart' as _i66;
import '../domain/usecases/get_invite_friends_usecase.dart' as _i22;
import '../domain/usecases/get_languages_usecase.dart' as _i64;
import '../domain/usecases/get_mentor_fetch_usecase.dart' as _i68;
import '../domain/usecases/get_notification_fetch_usecase.dart' as _i69;
import '../domain/usecases/get_payments_usecase.dart' as _i23;
import '../domain/usecases/get_pin_sending_usecase.dart' as _i45;
import '../domain/usecases/get_profile_usecase.dart' as _i24;
import '../domain/usecases/get_recent_search_fetch_usecase.dart' as _i73;
import '../domain/usecases/get_search_fetch_usecase.dart' as _i75;
import '../domain/usecases/invite_friend_usecase.dart' as _i31;
import '../domain/usecases/language_save_usecase.dart' as _i32;
import '../domain/usecases/language_usecase.dart' as _i33;
import '../domain/usecases/post_bookmark_addition_usecase.dart' as _i53;
import '../domain/usecases/post_bookmark_removal_usecase.dart' as _i55;
import '../domain/usecases/post_contact_selection_usecase.dart' as _i16;
import '../domain/usecases/post_password_creation_usecase.dart' as _i42;
import '../domain/usecases/post_pin_entry_usecase.dart' as _i44;
import '../domain/usecases/post_recent_search_addition_usecase.dart' as _i72;
import '../domain/usecases/post_recent_search_removal_usecase.dart' as _i74;
import '../domain/usecases/sign_in_usecase.dart' as _i50;
import '../domain/usecases/sign_up_usecase.dart' as _i51;
import '../domain/usecases/update_profile_usecase.dart' as _i52;
import '../module/register_module.dart' as _i85;
import '../presentation/_blocs/locale/locale_bloc.dart' as _i34;
import '../presentation/_blocs/theme/theme_bloc.dart' as _i5;
import '../presentation/account_setup/create_new_pin/bloc/create_new_pin_bloc.dart'
    as _i59;
import '../presentation/account_setup/fill_your_profile/bloc/fill_your_profile_bloc.dart'
    as _i60;
import '../presentation/edit_profile/bloc/edit_profile_bloc.dart' as _i81;
import '../presentation/forgot_and_reset_password/create_new_password/bloc/password_creation_bloc.dart'
    as _i70;
import '../presentation/forgot_and_reset_password/enter_pin/bloc/pin_entry_bloc.dart'
    as _i71;
import '../presentation/forgot_and_reset_password/select_contact/bloc/contact_selection_bloc.dart'
    as _i57;
import '../presentation/friends_invitation/bloc/friends_invitation_bloc.dart'
    as _i61;
import '../presentation/help_center/bloc/helper_center_bloc.dart' as _i65;
import '../presentation/home_and_action_menu/home/bloc/home_bloc.dart' as _i82;
import '../presentation/home_and_action_menu/most_popular_courses/bloc/course_bloc.dart'
    as _i80;
import '../presentation/home_and_action_menu/my_bookmark/bloc/bookmark_bloc.dart'
    as _i79;
import '../presentation/home_and_action_menu/notification/bloc/notification_bloc.dart'
    as _i83;
import '../presentation/home_and_action_menu/search/bloc/search_bloc.dart'
    as _i84;
import '../presentation/home_and_action_menu/top_mentors/bloc/top_mentors_bloc.dart'
    as _i78;
import '../presentation/language/bloc/language_bloc.dart' as _i67;
import '../presentation/letsin/signin/bloc/signin_bloc.dart' as _i76;
import '../presentation/letsin/signup/bloc/signup_bloc.dart' as _i77;
import '../presentation/new_card/bloc/new_card_bloc.dart' as _i38;
import '../presentation/payment/bloc/payment_bloc.dart' as _i43;
import '../presentation/profile/bloc/profile_bloc.dart'
    as _i46; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i6.UserApiService>(() => registerModule.userApiService(
      get<_i4.Dio>(instanceName: 'ApiDio'),
      get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i7.UserRepository>(() =>
      _i8.UserRepositoryImpl(get<_i3.AppCache>(), get<_i6.UserApiService>()));
  gh.factory<_i9.AccessTokenSaveUseCase>(
      () => _i9.AccessTokenSaveUseCase(get<_i7.UserRepository>()));
  gh.lazySingleton<_i10.AccessTokenUseCase>(
      () => _i10.AccessTokenUseCase(get<_i7.UserRepository>()));
  gh.factory<_i11.AddNewCardUseCase>(
      () => _i11.AddNewCardUseCase(get<_i7.UserRepository>()));
  gh.lazySingleton<_i12.BookmarkApiService>(() =>
      registerModule.bookmarkApiService(get<_i4.Dio>(instanceName: 'ApiDio'),
          get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i13.BookmarkRepository>(
      () => _i14.BookmarkRepositoryImpl(get<_i12.BookmarkApiService>()));
  gh.factory<_i15.ContactFetchUseCase>(
      () => _i15.ContactFetchUseCase(get<_i7.UserRepository>()));
  gh.factory<_i16.ContactSelectionUseCase>(
      () => _i16.ContactSelectionUseCase(get<_i7.UserRepository>()));
  gh.lazySingleton<_i17.CourseApiService>(() => registerModule.courseApiService(
      get<_i4.Dio>(instanceName: 'ApiDio'),
      get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i18.CourseRepository>(
      () => _i19.CourseRepositoryImpl(get<_i17.CourseApiService>()));
  gh.factory<_i20.CreateNewPinUseCase>(
      () => _i20.CreateNewPinUseCase(get<_i7.UserRepository>()));
  gh.factory<_i21.FillYourProfileUseCase>(
      () => _i21.FillYourProfileUseCase(get<_i7.UserRepository>()));
  gh.factory<_i22.GetInviteFriendsUseCase>(
      () => _i22.GetInviteFriendsUseCase(get<_i7.UserRepository>()));
  gh.factory<_i23.GetPaymentsUseCase>(
      () => _i23.GetPaymentsUseCase(get<_i7.UserRepository>()));
  gh.factory<_i24.GetProfileUseCase>(
      () => _i24.GetProfileUseCase(get<_i7.UserRepository>()));
  gh.lazySingleton<_i25.HelperApiService>(() => registerModule.helperApiService(
      get<_i4.Dio>(instanceName: 'ApiDio'),
      get<String>(instanceName: 'ApiBaseUrl')));
  gh.lazySingleton<_i26.HelperRepository>(() => _i27.HelperRepositoryImpl(
      get<_i3.AppCache>(), get<_i25.HelperApiService>()));
  gh.lazySingleton<_i28.HomeApiService>(() => registerModule.homeApiService(
      get<_i4.Dio>(instanceName: 'ApiDio'),
      get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i29.HomeRepository>(
      () => _i30.HomeRepositoryImpl(get<_i28.HomeApiService>()));
  gh.factory<_i31.InviteFriendUseCase>(
      () => _i31.InviteFriendUseCase(get<_i7.UserRepository>()));
  gh.lazySingleton<_i32.LanguageSaveUseCase>(
      () => _i32.LanguageSaveUseCase(get<_i26.HelperRepository>()));
  gh.lazySingleton<_i33.LanguageUseCase>(
      () => _i33.LanguageUseCase(get<_i26.HelperRepository>()));
  gh.factory<_i34.LocaleBloc>(
      () => _i34.LocaleBloc(get<_i33.LanguageUseCase>()));
  gh.lazySingleton<_i35.MentorApiService>(() => registerModule.mentorApiService(
      get<_i4.Dio>(instanceName: 'ApiDio'),
      get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i36.MentorRepository>(
      () => _i37.MentorRepositoryImpl(get<_i35.MentorApiService>()));
  gh.factory<_i38.NewCardBloc>(
      () => _i38.NewCardBloc(get<_i11.AddNewCardUseCase>()));
  gh.lazySingleton<_i39.NotificationApiService>(() =>
      registerModule.notificationApiService(
          get<_i4.Dio>(instanceName: 'ApiDio'),
          get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i40.NotificationRepository>(() =>
      _i41.NotificationRepositoryImpl(get<_i39.NotificationApiService>()));
  gh.factory<_i42.PasswordCreationUseCase>(
      () => _i42.PasswordCreationUseCase(get<_i7.UserRepository>()));
  gh.factory<_i43.PaymentBloc>(
      () => _i43.PaymentBloc(get<_i23.GetPaymentsUseCase>()));
  gh.factory<_i44.PinEntryUseCase>(
      () => _i44.PinEntryUseCase(get<_i7.UserRepository>()));
  gh.factory<_i45.PinSendingUseCase>(
      () => _i45.PinSendingUseCase(get<_i7.UserRepository>()));
  gh.factory<_i46.ProfileBloc>(() => _i46.ProfileBloc(
      get<_i24.GetProfileUseCase>(), get<_i33.LanguageUseCase>()));
  gh.lazySingleton<_i47.SearchApiService>(() => registerModule.searchApiService(
      get<_i4.Dio>(instanceName: 'ApiDio'),
      get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i48.SearchRepository>(
      () => _i49.SearchRepositoryImpl(get<_i47.SearchApiService>()));
  gh.factory<_i50.SignInUseCase>(
      () => _i50.SignInUseCase(get<_i7.UserRepository>()));
  gh.factory<_i51.SignUpUseCase>(
      () => _i51.SignUpUseCase(get<_i7.UserRepository>()));
  gh.factory<_i52.UpdateProfileUseCase>(
      () => _i52.UpdateProfileUseCase(get<_i7.UserRepository>()));
  gh.factory<_i53.BookmarkAdditionUseCase>(
      () => _i53.BookmarkAdditionUseCase(get<_i13.BookmarkRepository>()));
  gh.factory<_i54.BookmarkFetchUseCase>(
      () => _i54.BookmarkFetchUseCase(get<_i13.BookmarkRepository>()));
  gh.factory<_i55.BookmarkRemovalUseCase>(
      () => _i55.BookmarkRemovalUseCase(get<_i13.BookmarkRepository>()));
  gh.factory<_i56.ClearCacheUseCase>(
      () => _i56.ClearCacheUseCase(get<_i26.HelperRepository>()));
  gh.factory<_i57.ContactSelectionBloc>(() => _i57.ContactSelectionBloc(
      get<_i16.ContactSelectionUseCase>(), get<_i15.ContactFetchUseCase>()));
  gh.factory<_i58.CourseFetchUseCase>(
      () => _i58.CourseFetchUseCase(get<_i18.CourseRepository>()));
  gh.factory<_i59.CreateNewPinBloc>(
      () => _i59.CreateNewPinBloc(get<_i20.CreateNewPinUseCase>()));
  gh.factory<_i60.FillYourProfileBloc>(
      () => _i60.FillYourProfileBloc(get<_i21.FillYourProfileUseCase>()));
  gh.factory<_i61.FriendsInvitationBloc>(() => _i61.FriendsInvitationBloc(
      get<_i22.GetInviteFriendsUseCase>(), get<_i31.InviteFriendUseCase>()));
  gh.factory<_i62.GetCountriesUseCase>(
      () => _i62.GetCountriesUseCase(get<_i26.HelperRepository>()));
  gh.factory<_i63.GetHelperCenterUseCase>(
      () => _i63.GetHelperCenterUseCase(get<_i26.HelperRepository>()));
  gh.factory<_i64.GetLanguagesUseCase>(
      () => _i64.GetLanguagesUseCase(get<_i26.HelperRepository>()));
  gh.factory<_i65.HelperCenterBloc>(
      () => _i65.HelperCenterBloc(get<_i63.GetHelperCenterUseCase>()));
  gh.factory<_i66.HomeFetchUseCase>(
      () => _i66.HomeFetchUseCase(get<_i29.HomeRepository>()));
  gh.factory<_i67.LanguageBloc>(() => _i67.LanguageBloc(
      get<_i64.GetLanguagesUseCase>(), get<_i32.LanguageSaveUseCase>()));
  gh.factory<_i68.MentorFetchUseCase>(
      () => _i68.MentorFetchUseCase(get<_i36.MentorRepository>()));
  gh.factory<_i69.NotificationFetchUseCase>(
      () => _i69.NotificationFetchUseCase(get<_i40.NotificationRepository>()));
  gh.factory<_i70.PasswordCreationBloc>(
      () => _i70.PasswordCreationBloc(get<_i42.PasswordCreationUseCase>()));
  gh.factory<_i71.PinEntryBloc>(() => _i71.PinEntryBloc(
      get<_i45.PinSendingUseCase>(), get<_i44.PinEntryUseCase>()));
  gh.factory<_i72.RecentSearchAdditionUseCase>(
      () => _i72.RecentSearchAdditionUseCase(get<_i48.SearchRepository>()));
  gh.factory<_i73.RecentSearchFetchUseCase>(
      () => _i73.RecentSearchFetchUseCase(get<_i48.SearchRepository>()));
  gh.factory<_i74.RecentSearchRemovalUseCase>(
      () => _i74.RecentSearchRemovalUseCase(get<_i48.SearchRepository>()));
  gh.factory<_i75.SearchFetchUseCase>(
      () => _i75.SearchFetchUseCase(get<_i48.SearchRepository>()));
  gh.factory<_i76.SignInBloc>(() => _i76.SignInBloc(
      get<_i50.SignInUseCase>(), get<_i9.AccessTokenSaveUseCase>()));
  gh.factory<_i77.SignUpBloc>(() => _i77.SignUpBloc(get<_i51.SignUpUseCase>()));
  gh.factory<_i78.TopMentorsBloc>(
      () => _i78.TopMentorsBloc(get<_i68.MentorFetchUseCase>()));
  gh.factory<_i79.BookmarkBloc>(() => _i79.BookmarkBloc(
      get<_i54.BookmarkFetchUseCase>(), get<_i55.BookmarkRemovalUseCase>()));
  gh.factory<_i80.CourseBloc>(() => _i80.CourseBloc(
      get<_i58.CourseFetchUseCase>(),
      get<_i53.BookmarkAdditionUseCase>(),
      get<_i55.BookmarkRemovalUseCase>()));
  gh.factory<_i81.EditProfileBloc>(() => _i81.EditProfileBloc(
      get<_i62.GetCountriesUseCase>(), get<_i52.UpdateProfileUseCase>()));
  gh.factory<_i82.HomeBloc>(() => _i82.HomeBloc(get<_i66.HomeFetchUseCase>(),
      get<_i53.BookmarkAdditionUseCase>(), get<_i55.BookmarkRemovalUseCase>()));
  gh.factory<_i83.NotificationBloc>(
      () => _i83.NotificationBloc(get<_i69.NotificationFetchUseCase>()));
  gh.factory<_i84.SearchBloc>(() => _i84.SearchBloc(
      get<_i75.SearchFetchUseCase>(),
      get<_i73.RecentSearchFetchUseCase>(),
      get<_i72.RecentSearchAdditionUseCase>(),
      get<_i74.RecentSearchRemovalUseCase>(),
      get<_i53.BookmarkAdditionUseCase>(),
      get<_i55.BookmarkRemovalUseCase>()));
  return get;
}

class _$RegisterModule extends _i85.RegisterModule {}
