// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/nd_network/nd_network.dart' as _i4;
import '../data/datasources/local/cache/app_cache.dart' as _i3;
import '../data/datasources/remote/bookmark_api_service.dart' as _i11;
import '../data/datasources/remote/course_api_service.dart' as _i16;
import '../data/datasources/remote/helper_api_service.dart' as _i24;
import '../data/datasources/remote/home_api_service.dart' as _i27;
import '../data/datasources/remote/mentor_api_service.dart' as _i33;
import '../data/datasources/remote/notification_api_service.dart' as _i37;
import '../data/datasources/remote/search_api_service.dart' as _i45;
import '../data/datasources/remote/user_api_service.dart' as _i5;
import '../data/repositories/bookmark_repository_impl.dart' as _i13;
import '../data/repositories/courses_repository_impl.dart' as _i18;
import '../data/repositories/helper_repository_impl.dart' as _i26;
import '../data/repositories/home_repository_impl.dart' as _i29;
import '../data/repositories/mentor_repository_impl.dart' as _i35;
import '../data/repositories/notification_repository_impl.dart' as _i39;
import '../data/repositories/search_repository_impl.dart' as _i47;
import '../data/repositories/user_repository_impl.dart' as _i7;
import '../domain/repositories/bookmark_repository.dart' as _i12;
import '../domain/repositories/course_repository.dart' as _i17;
import '../domain/repositories/helper_repository.dart' as _i25;
import '../domain/repositories/home_repository.dart' as _i28;
import '../domain/repositories/mentor_repository.dart' as _i34;
import '../domain/repositories/notification_repository.dart' as _i38;
import '../domain/repositories/search_repository.dart' as _i46;
import '../domain/repositories/user_repository.dart' as _i6;
import '../domain/usecases/access_token_save_usecase.dart' as _i8;
import '../domain/usecases/access_token_usecase.dart' as _i9;
import '../domain/usecases/add_new_card_usecase.dart' as _i10;
import '../domain/usecases/create_new_pin_usecase.dart' as _i19;
import '../domain/usecases/fill_your_profile_usecase.dart' as _i20;
import '../domain/usecases/get_bookmark_fetch_usecase.dart' as _i52;
import '../domain/usecases/get_contact_fetch_usecase.dart' as _i14;
import '../domain/usecases/get_countries_usecase.dart' as _i59;
import '../domain/usecases/get_course_fetch_usecase.dart' as _i55;
import '../domain/usecases/get_helper_center_usecase.dart' as _i60;
import '../domain/usecases/get_home_fetch_usecase.dart' as _i63;
import '../domain/usecases/get_invite_friends_usecase.dart' as _i21;
import '../domain/usecases/get_languages_usecase.dart' as _i61;
import '../domain/usecases/get_mentor_fetch_usecase.dart' as _i65;
import '../domain/usecases/get_notification_fetch_usecase.dart' as _i66;
import '../domain/usecases/get_payments_usecase.dart' as _i22;
import '../domain/usecases/get_pin_sending_usecase.dart' as _i43;
import '../domain/usecases/get_profile_usecase.dart' as _i23;
import '../domain/usecases/get_recent_search_fetch_usecase.dart' as _i70;
import '../domain/usecases/get_search_fetch_usecase.dart' as _i72;
import '../domain/usecases/invite_friend_usecase.dart' as _i30;
import '../domain/usecases/language_save_usecase.dart' as _i31;
import '../domain/usecases/language_usecase.dart' as _i32;
import '../domain/usecases/post_bookmark_addition_usecase.dart' as _i51;
import '../domain/usecases/post_bookmark_removal_usecase.dart' as _i53;
import '../domain/usecases/post_contact_selection_usecase.dart' as _i15;
import '../domain/usecases/post_password_creation_usecase.dart' as _i40;
import '../domain/usecases/post_pin_entry_usecase.dart' as _i42;
import '../domain/usecases/post_recent_search_addition_usecase.dart' as _i69;
import '../domain/usecases/post_recent_search_removal_usecase.dart' as _i71;
import '../domain/usecases/sign_in_usecase.dart' as _i48;
import '../domain/usecases/sign_up_usecase.dart' as _i49;
import '../domain/usecases/update_profile_usecase.dart' as _i50;
import '../module/register_module.dart' as _i82;
import '../presentation/account_setup/create_new_pin/bloc/create_new_pin_bloc.dart'
    as _i56;
import '../presentation/account_setup/fill_your_profile/bloc/fill_your_profile_bloc.dart'
    as _i57;
import '../presentation/edit_profile/bloc/edit_profile_bloc.dart' as _i78;
import '../presentation/forgot_and_reset_password/create_new_password/bloc/password_creation_bloc.dart'
    as _i67;
import '../presentation/forgot_and_reset_password/enter_pin/bloc/pin_entry_bloc.dart'
    as _i68;
import '../presentation/forgot_and_reset_password/select_contact/bloc/contact_selection_bloc.dart'
    as _i54;
import '../presentation/friends_invitation/bloc/friends_invitation_bloc.dart'
    as _i58;
import '../presentation/help_center/bloc/helper_center_bloc.dart' as _i62;
import '../presentation/home_and_action_menu/home/bloc/home_bloc.dart' as _i79;
import '../presentation/home_and_action_menu/most_popular_courses/bloc/course_bloc.dart'
    as _i77;
import '../presentation/home_and_action_menu/my_bookmark/bloc/bookmark_bloc.dart'
    as _i76;
import '../presentation/home_and_action_menu/notification/bloc/notification_bloc.dart'
    as _i80;
import '../presentation/home_and_action_menu/search/bloc/search_bloc.dart'
    as _i81;
import '../presentation/home_and_action_menu/top_mentors/bloc/top_mentors_bloc.dart'
    as _i75;
import '../presentation/language/bloc/language_bloc.dart' as _i64;
import '../presentation/letsin/signin/bloc/signin_bloc.dart' as _i73;
import '../presentation/letsin/signup/bloc/signup_bloc.dart' as _i74;
import '../presentation/new_card/bloc/new_card_bloc.dart' as _i36;
import '../presentation/payment/bloc/payment_bloc.dart' as _i41;
import '../presentation/profile/bloc/profile_bloc.dart'
    as _i44; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i5.UserApiService>(() => registerModule.userApiService(
      get<_i4.Dio>(instanceName: 'ApiDio'),
      get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i6.UserRepository>(() =>
      _i7.UserRepositoryImpl(get<_i3.AppCache>(), get<_i5.UserApiService>()));
  gh.factory<_i8.AccessTokenSaveUseCase>(
      () => _i8.AccessTokenSaveUseCase(get<_i6.UserRepository>()));
  gh.lazySingleton<_i9.AccessTokenUseCase>(
      () => _i9.AccessTokenUseCase(get<_i6.UserRepository>()));
  gh.factory<_i10.AddNewCardUseCase>(
      () => _i10.AddNewCardUseCase(get<_i6.UserRepository>()));
  gh.lazySingleton<_i11.BookmarkApiService>(() =>
      registerModule.bookmarkApiService(get<_i4.Dio>(instanceName: 'ApiDio'),
          get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i12.BookmarkRepository>(
      () => _i13.BookmarkRepositoryImpl(get<_i11.BookmarkApiService>()));
  gh.factory<_i14.ContactFetchUseCase>(
      () => _i14.ContactFetchUseCase(get<_i6.UserRepository>()));
  gh.factory<_i15.ContactSelectionUseCase>(
      () => _i15.ContactSelectionUseCase(get<_i6.UserRepository>()));
  gh.lazySingleton<_i16.CourseApiService>(() => registerModule.courseApiService(
      get<_i4.Dio>(instanceName: 'ApiDio'),
      get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i17.CourseRepository>(
      () => _i18.CourseRepositoryImpl(get<_i16.CourseApiService>()));
  gh.factory<_i19.CreateNewPinUseCase>(
      () => _i19.CreateNewPinUseCase(get<_i6.UserRepository>()));
  gh.factory<_i20.FillYourProfileUseCase>(
      () => _i20.FillYourProfileUseCase(get<_i6.UserRepository>()));
  gh.factory<_i21.GetInviteFriendsUseCase>(
      () => _i21.GetInviteFriendsUseCase(get<_i6.UserRepository>()));
  gh.factory<_i22.GetPaymentsUseCase>(
      () => _i22.GetPaymentsUseCase(get<_i6.UserRepository>()));
  gh.factory<_i23.GetProfileUseCase>(
      () => _i23.GetProfileUseCase(get<_i6.UserRepository>()));
  gh.lazySingleton<_i24.HelperApiService>(() => registerModule.helperApiService(
      get<_i4.Dio>(instanceName: 'ApiDio'),
      get<String>(instanceName: 'ApiBaseUrl')));
  gh.lazySingleton<_i25.HelperRepository>(() => _i26.HelperRepositoryImpl(
      get<_i3.AppCache>(), get<_i24.HelperApiService>()));
  gh.lazySingleton<_i27.HomeApiService>(() => registerModule.homeApiService(
      get<_i4.Dio>(instanceName: 'ApiDio'),
      get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i28.HomeRepository>(
      () => _i29.HomeRepositoryImpl(get<_i27.HomeApiService>()));
  gh.factory<_i30.InviteFriendUseCase>(
      () => _i30.InviteFriendUseCase(get<_i6.UserRepository>()));
  gh.lazySingleton<_i31.LanguageSaveUseCase>(
      () => _i31.LanguageSaveUseCase(get<_i25.HelperRepository>()));
  gh.lazySingleton<_i32.LanguageUseCase>(
      () => _i32.LanguageUseCase(get<_i25.HelperRepository>()));
  gh.lazySingleton<_i33.MentorApiService>(() => registerModule.mentorApiService(
      get<_i4.Dio>(instanceName: 'ApiDio'),
      get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i34.MentorRepository>(
      () => _i35.MentorRepositoryImpl(get<_i33.MentorApiService>()));
  gh.factory<_i36.NewCardBloc>(
      () => _i36.NewCardBloc(get<_i10.AddNewCardUseCase>()));
  gh.lazySingleton<_i37.NotificationApiService>(() =>
      registerModule.notificationApiService(
          get<_i4.Dio>(instanceName: 'ApiDio'),
          get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i38.NotificationRepository>(() =>
      _i39.NotificationRepositoryImpl(get<_i37.NotificationApiService>()));
  gh.factory<_i40.PasswordCreationUseCase>(
      () => _i40.PasswordCreationUseCase(get<_i6.UserRepository>()));
  gh.factory<_i41.PaymentBloc>(
      () => _i41.PaymentBloc(get<_i22.GetPaymentsUseCase>()));
  gh.factory<_i42.PinEntryUseCase>(
      () => _i42.PinEntryUseCase(get<_i6.UserRepository>()));
  gh.factory<_i43.PinSendingUseCase>(
      () => _i43.PinSendingUseCase(get<_i6.UserRepository>()));
  gh.factory<_i44.ProfileBloc>(() => _i44.ProfileBloc(
      get<_i23.GetProfileUseCase>(), get<_i32.LanguageUseCase>()));
  gh.lazySingleton<_i45.SearchApiService>(() => registerModule.searchApiService(
      get<_i4.Dio>(instanceName: 'ApiDio'),
      get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i46.SearchRepository>(
      () => _i47.SearchRepositoryImpl(get<_i45.SearchApiService>()));
  gh.factory<_i48.SignInUseCase>(
      () => _i48.SignInUseCase(get<_i6.UserRepository>()));
  gh.factory<_i49.SignUpUseCase>(
      () => _i49.SignUpUseCase(get<_i6.UserRepository>()));
  gh.factory<_i50.UpdateProfileUseCase>(
      () => _i50.UpdateProfileUseCase(get<_i6.UserRepository>()));
  gh.factory<_i51.BookmarkAdditionUseCase>(
      () => _i51.BookmarkAdditionUseCase(get<_i12.BookmarkRepository>()));
  gh.factory<_i52.BookmarkFetchUseCase>(
      () => _i52.BookmarkFetchUseCase(get<_i12.BookmarkRepository>()));
  gh.factory<_i53.BookmarkRemovalUseCase>(
      () => _i53.BookmarkRemovalUseCase(get<_i12.BookmarkRepository>()));
  gh.factory<_i54.ContactSelectionBloc>(() => _i54.ContactSelectionBloc(
      get<_i15.ContactSelectionUseCase>(), get<_i14.ContactFetchUseCase>()));
  gh.factory<_i55.CourseFetchUseCase>(
      () => _i55.CourseFetchUseCase(get<_i17.CourseRepository>()));
  gh.factory<_i56.CreateNewPinBloc>(
      () => _i56.CreateNewPinBloc(get<_i19.CreateNewPinUseCase>()));
  gh.factory<_i57.FillYourProfileBloc>(
      () => _i57.FillYourProfileBloc(get<_i20.FillYourProfileUseCase>()));
  gh.factory<_i58.FriendsInvitationBloc>(() => _i58.FriendsInvitationBloc(
      get<_i21.GetInviteFriendsUseCase>(), get<_i30.InviteFriendUseCase>()));
  gh.factory<_i59.GetCountriesUseCase>(
      () => _i59.GetCountriesUseCase(get<_i25.HelperRepository>()));
  gh.factory<_i60.GetHelperCenterUseCase>(
      () => _i60.GetHelperCenterUseCase(get<_i25.HelperRepository>()));
  gh.factory<_i61.GetLanguagesUseCase>(
      () => _i61.GetLanguagesUseCase(get<_i25.HelperRepository>()));
  gh.factory<_i62.HelperCenterBloc>(
      () => _i62.HelperCenterBloc(get<_i60.GetHelperCenterUseCase>()));
  gh.factory<_i63.HomeFetchUseCase>(
      () => _i63.HomeFetchUseCase(get<_i28.HomeRepository>()));
  gh.factory<_i64.LanguageBloc>(() => _i64.LanguageBloc(
      get<_i61.GetLanguagesUseCase>(), get<_i31.LanguageSaveUseCase>()));
  gh.factory<_i65.MentorFetchUseCase>(
      () => _i65.MentorFetchUseCase(get<_i34.MentorRepository>()));
  gh.factory<_i66.NotificationFetchUseCase>(
      () => _i66.NotificationFetchUseCase(get<_i38.NotificationRepository>()));
  gh.factory<_i67.PasswordCreationBloc>(
      () => _i67.PasswordCreationBloc(get<_i40.PasswordCreationUseCase>()));
  gh.factory<_i68.PinEntryBloc>(() => _i68.PinEntryBloc(
      get<_i43.PinSendingUseCase>(), get<_i42.PinEntryUseCase>()));
  gh.factory<_i69.RecentSearchAdditionUseCase>(
      () => _i69.RecentSearchAdditionUseCase(get<_i46.SearchRepository>()));
  gh.factory<_i70.RecentSearchFetchUseCase>(
      () => _i70.RecentSearchFetchUseCase(get<_i46.SearchRepository>()));
  gh.factory<_i71.RecentSearchRemovalUseCase>(
      () => _i71.RecentSearchRemovalUseCase(get<_i46.SearchRepository>()));
  gh.factory<_i72.SearchFetchUseCase>(
      () => _i72.SearchFetchUseCase(get<_i46.SearchRepository>()));
  gh.factory<_i73.SignInBloc>(() => _i73.SignInBloc(
      get<_i48.SignInUseCase>(), get<_i8.AccessTokenSaveUseCase>()));
  gh.factory<_i74.SignUpBloc>(() => _i74.SignUpBloc(get<_i49.SignUpUseCase>()));
  gh.factory<_i75.TopMentorsBloc>(
      () => _i75.TopMentorsBloc(get<_i65.MentorFetchUseCase>()));
  gh.factory<_i76.BookmarkBloc>(() => _i76.BookmarkBloc(
      get<_i52.BookmarkFetchUseCase>(), get<_i53.BookmarkRemovalUseCase>()));
  gh.factory<_i77.CourseBloc>(() => _i77.CourseBloc(
      get<_i55.CourseFetchUseCase>(),
      get<_i51.BookmarkAdditionUseCase>(),
      get<_i53.BookmarkRemovalUseCase>()));
  gh.factory<_i78.EditProfileBloc>(() => _i78.EditProfileBloc(
      get<_i59.GetCountriesUseCase>(), get<_i50.UpdateProfileUseCase>()));
  gh.factory<_i79.HomeBloc>(() => _i79.HomeBloc(get<_i63.HomeFetchUseCase>(),
      get<_i51.BookmarkAdditionUseCase>(), get<_i53.BookmarkRemovalUseCase>()));
  gh.factory<_i80.NotificationBloc>(
      () => _i80.NotificationBloc(get<_i66.NotificationFetchUseCase>()));
  gh.factory<_i81.SearchBloc>(() => _i81.SearchBloc(
      get<_i72.SearchFetchUseCase>(),
      get<_i70.RecentSearchFetchUseCase>(),
      get<_i69.RecentSearchAdditionUseCase>(),
      get<_i71.RecentSearchRemovalUseCase>(),
      get<_i51.BookmarkAdditionUseCase>(),
      get<_i53.BookmarkRemovalUseCase>()));
  return get;
}

class _$RegisterModule extends _i82.RegisterModule {}
