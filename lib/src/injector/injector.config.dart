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
import '../data/datasources/remote/mentor_api_service.dart' as _i31;
import '../data/datasources/remote/notification_api_service.dart' as _i35;
import '../data/datasources/remote/search_api_service.dart' as _i43;
import '../data/datasources/remote/user_api_service.dart' as _i5;
import '../data/repositories/bookmark_repository_impl.dart' as _i13;
import '../data/repositories/courses_repository_impl.dart' as _i18;
import '../data/repositories/helper_repository_impl.dart' as _i26;
import '../data/repositories/home_repository_impl.dart' as _i29;
import '../data/repositories/mentor_repository_impl.dart' as _i33;
import '../data/repositories/notification_repository_impl.dart' as _i37;
import '../data/repositories/search_repository_impl.dart' as _i45;
import '../data/repositories/user_repository_impl.dart' as _i7;
import '../domain/repositories/bookmark_repository.dart' as _i12;
import '../domain/repositories/course_repository.dart' as _i17;
import '../domain/repositories/helper_repository.dart' as _i25;
import '../domain/repositories/home_repository.dart' as _i28;
import '../domain/repositories/mentor_repository.dart' as _i32;
import '../domain/repositories/notification_repository.dart' as _i36;
import '../domain/repositories/search_repository.dart' as _i44;
import '../domain/repositories/user_repository.dart' as _i6;
import '../domain/usecases/access_token_save_usecase.dart' as _i8;
import '../domain/usecases/access_token_usecase.dart' as _i9;
import '../domain/usecases/add_new_card_usecase.dart' as _i10;
import '../domain/usecases/create_new_pin_usecase.dart' as _i19;
import '../domain/usecases/fill_your_profile_usecase.dart' as _i20;
import '../domain/usecases/get_bookmark_fetch_usecase.dart' as _i50;
import '../domain/usecases/get_contact_fetch_usecase.dart' as _i14;
import '../domain/usecases/get_countries_usecase.dart' as _i57;
import '../domain/usecases/get_course_fetch_usecase.dart' as _i53;
import '../domain/usecases/get_helper_center_usecase.dart' as _i58;
import '../domain/usecases/get_home_fetch_usecase.dart' as _i61;
import '../domain/usecases/get_invite_friends_usecase.dart' as _i21;
import '../domain/usecases/get_languages_usecase.dart' as _i59;
import '../domain/usecases/get_mentor_fetch_usecase.dart' as _i63;
import '../domain/usecases/get_notification_fetch_usecase.dart' as _i64;
import '../domain/usecases/get_payments_usecase.dart' as _i22;
import '../domain/usecases/get_pin_sending_usecase.dart' as _i41;
import '../domain/usecases/get_profile_usecase.dart' as _i23;
import '../domain/usecases/get_recent_search_fetch_usecase.dart' as _i68;
import '../domain/usecases/get_search_fetch_usecase.dart' as _i70;
import '../domain/usecases/invite_friend_usecase.dart' as _i30;
import '../domain/usecases/post_bookmark_addition_usecase.dart' as _i49;
import '../domain/usecases/post_bookmark_removal_usecase.dart' as _i51;
import '../domain/usecases/post_contact_selection_usecase.dart' as _i15;
import '../domain/usecases/post_password_creation_usecase.dart' as _i38;
import '../domain/usecases/post_pin_entry_usecase.dart' as _i40;
import '../domain/usecases/post_recent_search_addition_usecase.dart' as _i67;
import '../domain/usecases/post_recent_search_removal_usecase.dart' as _i69;
import '../domain/usecases/sign_in_usecase.dart' as _i46;
import '../domain/usecases/sign_up_usecase.dart' as _i47;
import '../domain/usecases/update_profile_usecase.dart' as _i48;
import '../module/register_module.dart' as _i80;
import '../presentation/account_setup/create_new_pin/bloc/create_new_pin_bloc.dart'
    as _i54;
import '../presentation/account_setup/fill_your_profile/bloc/fill_your_profile_bloc.dart'
    as _i55;
import '../presentation/edit_profile/bloc/edit_profile_bloc.dart' as _i76;
import '../presentation/forgot_and_reset_password/create_new_password/bloc/password_creation_bloc.dart'
    as _i65;
import '../presentation/forgot_and_reset_password/enter_pin/bloc/pin_entry_bloc.dart'
    as _i66;
import '../presentation/forgot_and_reset_password/select_contact/bloc/contact_selection_bloc.dart'
    as _i52;
import '../presentation/friends_invitation/bloc/friends_invitation_bloc.dart'
    as _i56;
import '../presentation/help_center/bloc/helper_center_bloc.dart' as _i60;
import '../presentation/home_and_action_menu/home/bloc/home_bloc.dart' as _i77;
import '../presentation/home_and_action_menu/most_popular_courses/bloc/course_bloc.dart'
    as _i75;
import '../presentation/home_and_action_menu/my_bookmark/bloc/bookmark_bloc.dart'
    as _i74;
import '../presentation/home_and_action_menu/notification/bloc/notification_bloc.dart'
    as _i78;
import '../presentation/home_and_action_menu/search/bloc/search_bloc.dart'
    as _i79;
import '../presentation/home_and_action_menu/top_mentors/bloc/top_mentors_bloc.dart'
    as _i73;
import '../presentation/language/bloc/language_bloc.dart' as _i62;
import '../presentation/letsin/signin/bloc/signin_bloc.dart' as _i71;
import '../presentation/letsin/signup/bloc/signup_bloc.dart' as _i72;
import '../presentation/new_card/bloc/new_card_bloc.dart' as _i34;
import '../presentation/payment/bloc/payment_bloc.dart' as _i39;
import '../presentation/profile/bloc/profile_bloc.dart'
    as _i42; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i25.HelperRepository>(
      () => _i26.HelperRepositoryImpl(get<_i24.HelperApiService>()));
  gh.lazySingleton<_i27.HomeApiService>(() => registerModule.homeApiService(
      get<_i4.Dio>(instanceName: 'ApiDio'),
      get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i28.HomeRepository>(
      () => _i29.HomeRepositoryImpl(get<_i27.HomeApiService>()));
  gh.factory<_i30.InviteFriendUseCase>(
      () => _i30.InviteFriendUseCase(get<_i6.UserRepository>()));
  gh.lazySingleton<_i31.MentorApiService>(() => registerModule.mentorApiService(
      get<_i4.Dio>(instanceName: 'ApiDio'),
      get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i32.MentorRepository>(
      () => _i33.MentorRepositoryImpl(get<_i31.MentorApiService>()));
  gh.factory<_i34.NewCardBloc>(
      () => _i34.NewCardBloc(get<_i10.AddNewCardUseCase>()));
  gh.lazySingleton<_i35.NotificationApiService>(() =>
      registerModule.notificationApiService(
          get<_i4.Dio>(instanceName: 'ApiDio'),
          get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i36.NotificationRepository>(() =>
      _i37.NotificationRepositoryImpl(get<_i35.NotificationApiService>()));
  gh.factory<_i38.PasswordCreationUseCase>(
      () => _i38.PasswordCreationUseCase(get<_i6.UserRepository>()));
  gh.factory<_i39.PaymentBloc>(
      () => _i39.PaymentBloc(get<_i22.GetPaymentsUseCase>()));
  gh.factory<_i40.PinEntryUseCase>(
      () => _i40.PinEntryUseCase(get<_i6.UserRepository>()));
  gh.factory<_i41.PinSendingUseCase>(
      () => _i41.PinSendingUseCase(get<_i6.UserRepository>()));
  gh.factory<_i42.ProfileBloc>(
      () => _i42.ProfileBloc(get<_i23.GetProfileUseCase>()));
  gh.lazySingleton<_i43.SearchApiService>(() => registerModule.searchApiService(
      get<_i4.Dio>(instanceName: 'ApiDio'),
      get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i44.SearchRepository>(
      () => _i45.SearchRepositoryImpl(get<_i43.SearchApiService>()));
  gh.factory<_i46.SignInUseCase>(
      () => _i46.SignInUseCase(get<_i6.UserRepository>()));
  gh.factory<_i47.SignUpUseCase>(
      () => _i47.SignUpUseCase(get<_i6.UserRepository>()));
  gh.factory<_i48.UpdateProfileUseCase>(
      () => _i48.UpdateProfileUseCase(get<_i6.UserRepository>()));
  gh.factory<_i49.BookmarkAdditionUseCase>(
      () => _i49.BookmarkAdditionUseCase(get<_i12.BookmarkRepository>()));
  gh.factory<_i50.BookmarkFetchUseCase>(
      () => _i50.BookmarkFetchUseCase(get<_i12.BookmarkRepository>()));
  gh.factory<_i51.BookmarkRemovalUseCase>(
      () => _i51.BookmarkRemovalUseCase(get<_i12.BookmarkRepository>()));
  gh.factory<_i52.ContactSelectionBloc>(() => _i52.ContactSelectionBloc(
      get<_i15.ContactSelectionUseCase>(), get<_i14.ContactFetchUseCase>()));
  gh.factory<_i53.CourseFetchUseCase>(
      () => _i53.CourseFetchUseCase(get<_i17.CourseRepository>()));
  gh.factory<_i54.CreateNewPinBloc>(
      () => _i54.CreateNewPinBloc(get<_i19.CreateNewPinUseCase>()));
  gh.factory<_i55.FillYourProfileBloc>(
      () => _i55.FillYourProfileBloc(get<_i20.FillYourProfileUseCase>()));
  gh.factory<_i56.FriendsInvitationBloc>(() => _i56.FriendsInvitationBloc(
      get<_i21.GetInviteFriendsUseCase>(), get<_i30.InviteFriendUseCase>()));
  gh.factory<_i57.GetCountriesUseCase>(
      () => _i57.GetCountriesUseCase(get<_i25.HelperRepository>()));
  gh.factory<_i58.GetHelperCenterUseCase>(
      () => _i58.GetHelperCenterUseCase(get<_i25.HelperRepository>()));
  gh.factory<_i59.GetLanguagesUseCase>(
      () => _i59.GetLanguagesUseCase(get<_i25.HelperRepository>()));
  gh.factory<_i60.HelperCenterBloc>(
      () => _i60.HelperCenterBloc(get<_i58.GetHelperCenterUseCase>()));
  gh.factory<_i61.HomeFetchUseCase>(
      () => _i61.HomeFetchUseCase(get<_i28.HomeRepository>()));
  gh.factory<_i62.LanguageBloc>(
      () => _i62.LanguageBloc(get<_i59.GetLanguagesUseCase>()));
  gh.factory<_i63.MentorFetchUseCase>(
      () => _i63.MentorFetchUseCase(get<_i32.MentorRepository>()));
  gh.factory<_i64.NotificationFetchUseCase>(
      () => _i64.NotificationFetchUseCase(get<_i36.NotificationRepository>()));
  gh.factory<_i65.PasswordCreationBloc>(
      () => _i65.PasswordCreationBloc(get<_i38.PasswordCreationUseCase>()));
  gh.factory<_i66.PinEntryBloc>(() => _i66.PinEntryBloc(
      get<_i41.PinSendingUseCase>(), get<_i40.PinEntryUseCase>()));
  gh.factory<_i67.RecentSearchAdditionUseCase>(
      () => _i67.RecentSearchAdditionUseCase(get<_i44.SearchRepository>()));
  gh.factory<_i68.RecentSearchFetchUseCase>(
      () => _i68.RecentSearchFetchUseCase(get<_i44.SearchRepository>()));
  gh.factory<_i69.RecentSearchRemovalUseCase>(
      () => _i69.RecentSearchRemovalUseCase(get<_i44.SearchRepository>()));
  gh.factory<_i70.SearchFetchUseCase>(
      () => _i70.SearchFetchUseCase(get<_i44.SearchRepository>()));
  gh.factory<_i71.SignInBloc>(() => _i71.SignInBloc(
      get<_i46.SignInUseCase>(), get<_i8.AccessTokenSaveUseCase>()));
  gh.factory<_i72.SignUpBloc>(() => _i72.SignUpBloc(get<_i47.SignUpUseCase>()));
  gh.factory<_i73.TopMentorsBloc>(
      () => _i73.TopMentorsBloc(get<_i63.MentorFetchUseCase>()));
  gh.factory<_i74.BookmarkBloc>(() => _i74.BookmarkBloc(
      get<_i50.BookmarkFetchUseCase>(), get<_i51.BookmarkRemovalUseCase>()));
  gh.factory<_i75.CourseBloc>(() => _i75.CourseBloc(
      get<_i53.CourseFetchUseCase>(),
      get<_i49.BookmarkAdditionUseCase>(),
      get<_i51.BookmarkRemovalUseCase>()));
  gh.factory<_i76.EditProfileBloc>(() => _i76.EditProfileBloc(
      get<_i57.GetCountriesUseCase>(), get<_i48.UpdateProfileUseCase>()));
  gh.factory<_i77.HomeBloc>(() => _i77.HomeBloc(get<_i61.HomeFetchUseCase>(),
      get<_i49.BookmarkAdditionUseCase>(), get<_i51.BookmarkRemovalUseCase>()));
  gh.factory<_i78.NotificationBloc>(
      () => _i78.NotificationBloc(get<_i64.NotificationFetchUseCase>()));
  gh.factory<_i79.SearchBloc>(() => _i79.SearchBloc(
      get<_i70.SearchFetchUseCase>(),
      get<_i68.RecentSearchFetchUseCase>(),
      get<_i67.RecentSearchAdditionUseCase>(),
      get<_i69.RecentSearchRemovalUseCase>(),
      get<_i49.BookmarkAdditionUseCase>(),
      get<_i51.BookmarkRemovalUseCase>()));
  return get;
}

class _$RegisterModule extends _i80.RegisterModule {}
