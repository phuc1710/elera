// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/nd_network/nd_network.dart' as _i3;
import '../data/datasources/remote/bookmark_api_service.dart' as _i9;
import '../data/datasources/remote/course_api_service.dart' as _i14;
import '../data/datasources/remote/helper_api_service.dart' as _i22;
import '../data/datasources/remote/home_api_service.dart' as _i25;
import '../data/datasources/remote/mentor_api_service.dart' as _i29;
import '../data/datasources/remote/notification_api_service.dart' as _i33;
import '../data/datasources/remote/search_api_service.dart' as _i41;
import '../data/datasources/remote/user_api_service.dart' as _i5;
import '../data/repositories/bookmark_repository_impl.dart' as _i11;
import '../data/repositories/courses_repository_impl.dart' as _i16;
import '../data/repositories/helper_repository_impl.dart' as _i24;
import '../data/repositories/home_repository_impl.dart' as _i27;
import '../data/repositories/mentor_repository_impl.dart' as _i31;
import '../data/repositories/notification_repository_impl.dart' as _i35;
import '../data/repositories/search_repository_impl.dart' as _i43;
import '../data/repositories/user_repository_impl.dart' as _i7;
import '../domain/repositories/bookmark_repository.dart' as _i10;
import '../domain/repositories/course_repository.dart' as _i15;
import '../domain/repositories/helper_repository.dart' as _i23;
import '../domain/repositories/home_repository.dart' as _i26;
import '../domain/repositories/mentor_repository.dart' as _i30;
import '../domain/repositories/notification_repository.dart' as _i34;
import '../domain/repositories/search_repository.dart' as _i42;
import '../domain/repositories/user_repository.dart' as _i6;
import '../domain/usecases/add_new_card_usecase.dart' as _i8;
import '../domain/usecases/create_new_pin_usecase.dart' as _i17;
import '../domain/usecases/fill_your_profile_usecase.dart' as _i18;
import '../domain/usecases/get_bookmark_fetch_usecase.dart' as _i48;
import '../domain/usecases/get_contact_fetch_usecase.dart' as _i12;
import '../domain/usecases/get_countries_usecase.dart' as _i55;
import '../domain/usecases/get_course_fetch_usecase.dart' as _i51;
import '../domain/usecases/get_helper_center_usecase.dart' as _i56;
import '../domain/usecases/get_home_fetch_usecase.dart' as _i59;
import '../domain/usecases/get_invite_friends_usecase.dart' as _i19;
import '../domain/usecases/get_languages_usecase.dart' as _i57;
import '../domain/usecases/get_mentor_fetch_usecase.dart' as _i61;
import '../domain/usecases/get_notification_fetch_usecase.dart' as _i62;
import '../domain/usecases/get_payments_usecase.dart' as _i20;
import '../domain/usecases/get_pin_sending_usecase.dart' as _i39;
import '../domain/usecases/get_profile_usecase.dart' as _i21;
import '../domain/usecases/get_recent_search_fetch_usecase.dart' as _i66;
import '../domain/usecases/get_search_fetch_usecase.dart' as _i68;
import '../domain/usecases/invite_friend_usecase.dart' as _i28;
import '../domain/usecases/post_bookmark_addition_usecase.dart' as _i47;
import '../domain/usecases/post_bookmark_removal_usecase.dart' as _i49;
import '../domain/usecases/post_contact_selection_usecase.dart' as _i13;
import '../domain/usecases/post_password_creation_usecase.dart' as _i36;
import '../domain/usecases/post_pin_entry_usecase.dart' as _i38;
import '../domain/usecases/post_recent_search_addition_usecase.dart' as _i65;
import '../domain/usecases/post_recent_search_removal_usecase.dart' as _i67;
import '../domain/usecases/sign_in_usecase.dart' as _i44;
import '../domain/usecases/sign_up_usecase.dart' as _i45;
import '../domain/usecases/update_profile_usecase.dart' as _i46;
import '../module/register_module.dart' as _i78;
import '../presentation/_blocs/theme/theme_bloc.dart' as _i4;
import '../presentation/account_setup/create_new_pin/bloc/create_new_pin_bloc.dart'
    as _i52;
import '../presentation/account_setup/fill_your_profile/bloc/fill_your_profile_bloc.dart'
    as _i53;
import '../presentation/edit_profile/bloc/edit_profile_bloc.dart' as _i74;
import '../presentation/forgot_and_reset_password/create_new_password/bloc/password_creation_bloc.dart'
    as _i63;
import '../presentation/forgot_and_reset_password/enter_pin/bloc/pin_entry_bloc.dart'
    as _i64;
import '../presentation/forgot_and_reset_password/select_contact/bloc/contact_selection_bloc.dart'
    as _i50;
import '../presentation/friends_invitation/bloc/friends_invitation_bloc.dart'
    as _i54;
import '../presentation/help_center/bloc/helper_center_bloc.dart' as _i58;
import '../presentation/home_and_action_menu/home/bloc/home_bloc.dart' as _i75;
import '../presentation/home_and_action_menu/most_popular_courses/bloc/course_bloc.dart'
    as _i73;
import '../presentation/home_and_action_menu/my_bookmark/bloc/bookmark_bloc.dart'
    as _i72;
import '../presentation/home_and_action_menu/notification/bloc/notification_bloc.dart'
    as _i76;
import '../presentation/home_and_action_menu/search/bloc/search_bloc.dart'
    as _i77;
import '../presentation/home_and_action_menu/top_mentors/bloc/top_mentors_bloc.dart'
    as _i71;
import '../presentation/language/bloc/language_bloc.dart' as _i60;
import '../presentation/letsin/signin/bloc/signin_bloc.dart' as _i69;
import '../presentation/letsin/signup/bloc/signup_bloc.dart' as _i70;
import '../presentation/new_card/bloc/new_card_bloc.dart' as _i32;
import '../presentation/payment/bloc/payment_bloc.dart' as _i37;
import '../presentation/profile/bloc/profile_bloc.dart'
    as _i40; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.Dio>(() => registerModule.apiDio, instanceName: 'ApiDio');
  gh.factory<String>(() => registerModule.apiBaseUrl,
      instanceName: 'ApiBaseUrl');
  gh.factory<_i4.ThemeBloc>(() => _i4.ThemeBloc());
  gh.lazySingleton<_i5.UserApiService>(() => registerModule.userApiService(
      get<_i3.Dio>(instanceName: 'ApiDio'),
      get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i6.UserRepository>(
      () => _i7.UserRepositoryImpl(get<_i5.UserApiService>()));
  gh.factory<_i8.AddNewCardUseCase>(
      () => _i8.AddNewCardUseCase(get<_i6.UserRepository>()));
  gh.lazySingleton<_i9.BookmarkApiService>(() =>
      registerModule.bookmarkApiService(get<_i3.Dio>(instanceName: 'ApiDio'),
          get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i10.BookmarkRepository>(
      () => _i11.BookmarkRepositoryImpl(get<_i9.BookmarkApiService>()));
  gh.factory<_i12.ContactFetchUseCase>(
      () => _i12.ContactFetchUseCase(get<_i6.UserRepository>()));
  gh.factory<_i13.ContactSelectionUseCase>(
      () => _i13.ContactSelectionUseCase(get<_i6.UserRepository>()));
  gh.lazySingleton<_i14.CourseApiService>(() => registerModule.courseApiService(
      get<_i3.Dio>(instanceName: 'ApiDio'),
      get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i15.CourseRepository>(
      () => _i16.CourseRepositoryImpl(get<_i14.CourseApiService>()));
  gh.factory<_i17.CreateNewPinUseCase>(
      () => _i17.CreateNewPinUseCase(get<_i6.UserRepository>()));
  gh.factory<_i18.FillYourProfileUseCase>(
      () => _i18.FillYourProfileUseCase(get<_i6.UserRepository>()));
  gh.factory<_i19.GetInviteFriendsUseCase>(
      () => _i19.GetInviteFriendsUseCase(get<_i6.UserRepository>()));
  gh.factory<_i20.GetPaymentsUseCase>(
      () => _i20.GetPaymentsUseCase(get<_i6.UserRepository>()));
  gh.factory<_i21.GetProfileUseCase>(
      () => _i21.GetProfileUseCase(get<_i6.UserRepository>()));
  gh.lazySingleton<_i22.HelperApiService>(() => registerModule.helperApiService(
      get<_i3.Dio>(instanceName: 'ApiDio'),
      get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i23.HelperRepository>(
      () => _i24.HelperRepositoryImpl(get<_i22.HelperApiService>()));
  gh.lazySingleton<_i25.HomeApiService>(() => registerModule.homeApiService(
      get<_i3.Dio>(instanceName: 'ApiDio'),
      get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i26.HomeRepository>(
      () => _i27.HomeRepositoryImpl(get<_i25.HomeApiService>()));
  gh.factory<_i28.InviteFriendUseCase>(
      () => _i28.InviteFriendUseCase(get<_i6.UserRepository>()));
  gh.lazySingleton<_i29.MentorApiService>(() => registerModule.mentorApiService(
      get<_i3.Dio>(instanceName: 'ApiDio'),
      get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i30.MentorRepository>(
      () => _i31.MentorRepositoryImpl(get<_i29.MentorApiService>()));
  gh.factory<_i32.NewCardBloc>(
      () => _i32.NewCardBloc(get<_i8.AddNewCardUseCase>()));
  gh.lazySingleton<_i33.NotificationApiService>(() =>
      registerModule.notificationApiService(
          get<_i3.Dio>(instanceName: 'ApiDio'),
          get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i34.NotificationRepository>(() =>
      _i35.NotificationRepositoryImpl(get<_i33.NotificationApiService>()));
  gh.factory<_i36.PasswordCreationUseCase>(
      () => _i36.PasswordCreationUseCase(get<_i6.UserRepository>()));
  gh.factory<_i37.PaymentBloc>(
      () => _i37.PaymentBloc(get<_i20.GetPaymentsUseCase>()));
  gh.factory<_i38.PinEntryUseCase>(
      () => _i38.PinEntryUseCase(get<_i6.UserRepository>()));
  gh.factory<_i39.PinSendingUseCase>(
      () => _i39.PinSendingUseCase(get<_i6.UserRepository>()));
  gh.factory<_i40.ProfileBloc>(
      () => _i40.ProfileBloc(get<_i21.GetProfileUseCase>()));
  gh.lazySingleton<_i41.SearchApiService>(() => registerModule.searchApiService(
      get<_i3.Dio>(instanceName: 'ApiDio'),
      get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i42.SearchRepository>(
      () => _i43.SearchRepositoryImpl(get<_i41.SearchApiService>()));
  gh.factory<_i44.SignInUseCase>(
      () => _i44.SignInUseCase(get<_i6.UserRepository>()));
  gh.factory<_i45.SignUpUseCase>(
      () => _i45.SignUpUseCase(get<_i6.UserRepository>()));
  gh.factory<_i46.UpdateProfileUseCase>(
      () => _i46.UpdateProfileUseCase(get<_i6.UserRepository>()));
  gh.factory<_i47.BookmarkAdditionUseCase>(
      () => _i47.BookmarkAdditionUseCase(get<_i10.BookmarkRepository>()));
  gh.factory<_i48.BookmarkFetchUseCase>(
      () => _i48.BookmarkFetchUseCase(get<_i10.BookmarkRepository>()));
  gh.factory<_i49.BookmarkRemovalUseCase>(
      () => _i49.BookmarkRemovalUseCase(get<_i10.BookmarkRepository>()));
  gh.factory<_i50.ContactSelectionBloc>(() => _i50.ContactSelectionBloc(
      get<_i13.ContactSelectionUseCase>(), get<_i12.ContactFetchUseCase>()));
  gh.factory<_i51.CourseFetchUseCase>(
      () => _i51.CourseFetchUseCase(get<_i15.CourseRepository>()));
  gh.factory<_i52.CreateNewPinBloc>(
      () => _i52.CreateNewPinBloc(get<_i17.CreateNewPinUseCase>()));
  gh.factory<_i53.FillYourProfileBloc>(
      () => _i53.FillYourProfileBloc(get<_i18.FillYourProfileUseCase>()));
  gh.factory<_i54.FriendsInvitationBloc>(() => _i54.FriendsInvitationBloc(
      get<_i19.GetInviteFriendsUseCase>(), get<_i28.InviteFriendUseCase>()));
  gh.factory<_i55.GetCountriesUseCase>(
      () => _i55.GetCountriesUseCase(get<_i23.HelperRepository>()));
  gh.factory<_i56.GetHelperCenterUseCase>(
      () => _i56.GetHelperCenterUseCase(get<_i23.HelperRepository>()));
  gh.factory<_i57.GetLanguagesUseCase>(
      () => _i57.GetLanguagesUseCase(get<_i23.HelperRepository>()));
  gh.factory<_i58.HelperCenterBloc>(
      () => _i58.HelperCenterBloc(get<_i56.GetHelperCenterUseCase>()));
  gh.factory<_i59.HomeFetchUseCase>(
      () => _i59.HomeFetchUseCase(get<_i26.HomeRepository>()));
  gh.factory<_i60.LanguageBloc>(
      () => _i60.LanguageBloc(get<_i57.GetLanguagesUseCase>()));
  gh.factory<_i61.MentorFetchUseCase>(
      () => _i61.MentorFetchUseCase(get<_i30.MentorRepository>()));
  gh.factory<_i62.NotificationFetchUseCase>(
      () => _i62.NotificationFetchUseCase(get<_i34.NotificationRepository>()));
  gh.factory<_i63.PasswordCreationBloc>(
      () => _i63.PasswordCreationBloc(get<_i36.PasswordCreationUseCase>()));
  gh.factory<_i64.PinEntryBloc>(() => _i64.PinEntryBloc(
      get<_i39.PinSendingUseCase>(), get<_i38.PinEntryUseCase>()));
  gh.factory<_i65.RecentSearchAdditionUseCase>(
      () => _i65.RecentSearchAdditionUseCase(get<_i42.SearchRepository>()));
  gh.factory<_i66.RecentSearchFetchUseCase>(
      () => _i66.RecentSearchFetchUseCase(get<_i42.SearchRepository>()));
  gh.factory<_i67.RecentSearchRemovalUseCase>(
      () => _i67.RecentSearchRemovalUseCase(get<_i42.SearchRepository>()));
  gh.factory<_i68.SearchFetchUseCase>(
      () => _i68.SearchFetchUseCase(get<_i42.SearchRepository>()));
  gh.factory<_i69.SignInBloc>(() => _i69.SignInBloc(get<_i44.SignInUseCase>()));
  gh.factory<_i70.SignUpBloc>(() => _i70.SignUpBloc(get<_i45.SignUpUseCase>()));
  gh.factory<_i71.TopMentorsBloc>(
      () => _i71.TopMentorsBloc(get<_i61.MentorFetchUseCase>()));
  gh.factory<_i72.BookmarkBloc>(() => _i72.BookmarkBloc(
      get<_i48.BookmarkFetchUseCase>(), get<_i49.BookmarkRemovalUseCase>()));
  gh.factory<_i73.CourseBloc>(() => _i73.CourseBloc(
      get<_i51.CourseFetchUseCase>(),
      get<_i47.BookmarkAdditionUseCase>(),
      get<_i49.BookmarkRemovalUseCase>()));
  gh.factory<_i74.EditProfileBloc>(() => _i74.EditProfileBloc(
      get<_i55.GetCountriesUseCase>(), get<_i46.UpdateProfileUseCase>()));
  gh.factory<_i75.HomeBloc>(() => _i75.HomeBloc(get<_i59.HomeFetchUseCase>(),
      get<_i47.BookmarkAdditionUseCase>(), get<_i49.BookmarkRemovalUseCase>()));
  gh.factory<_i76.NotificationBloc>(
      () => _i76.NotificationBloc(get<_i62.NotificationFetchUseCase>()));
  gh.factory<_i77.SearchBloc>(() => _i77.SearchBloc(
      get<_i68.SearchFetchUseCase>(),
      get<_i66.RecentSearchFetchUseCase>(),
      get<_i65.RecentSearchAdditionUseCase>(),
      get<_i67.RecentSearchRemovalUseCase>(),
      get<_i47.BookmarkAdditionUseCase>(),
      get<_i49.BookmarkRemovalUseCase>()));
  return get;
}

class _$RegisterModule extends _i78.RegisterModule {}
