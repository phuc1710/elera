// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/nd_network/nd_network.dart' as _i3;
import '../data/datasources/remote/bookmark_api_service.dart' as _i8;
import '../data/datasources/remote/helper_api_service.dart' as _i18;
import '../data/datasources/remote/home_api_service.dart' as _i21;
import '../data/datasources/remote/mentor_api_service.dart' as _i25;
import '../data/datasources/remote/notification_api_service.dart' as _i29;
import '../data/datasources/remote/user_api_service.dart' as _i4;
import '../data/repositories/bookmark_repository_impl.dart' as _i10;
import '../data/repositories/helper_repository_impl.dart' as _i20;
import '../data/repositories/home_repository_impl.dart' as _i23;
import '../data/repositories/mentor_repository_impl.dart' as _i27;
import '../data/repositories/notification_repository_impl.dart' as _i31;
import '../data/repositories/user_repository_impl.dart' as _i6;
import '../domain/repositories/bookmark_repository.dart' as _i9;
import '../domain/repositories/helper_repository.dart' as _i19;
import '../domain/repositories/home_repository.dart' as _i22;
import '../domain/repositories/mentor_repository.dart' as _i26;
import '../domain/repositories/notification_repository.dart' as _i30;
import '../domain/repositories/user_repository.dart' as _i5;
import '../domain/usecases/add_new_card_usecase.dart' as _i7;
import '../domain/usecases/create_new_pin_usecase.dart' as _i13;
import '../domain/usecases/fill_your_profile_usecase.dart' as _i14;
import '../domain/usecases/get_bookmark_fetch_usecase.dart' as _i41;
import '../domain/usecases/get_contact_fetch_usecase.dart' as _i11;
import '../domain/usecases/get_countries_usecase.dart' as _i47;
import '../domain/usecases/get_helper_center_usecase.dart' as _i48;
import '../domain/usecases/get_home_fetch_usecase.dart' as _i51;
import '../domain/usecases/get_invite_friends_usecase.dart' as _i15;
import '../domain/usecases/get_languages_usecase.dart' as _i49;
import '../domain/usecases/get_mentor_fetch_usecase.dart' as _i53;
import '../domain/usecases/get_notification_fetch_usecase.dart' as _i54;
import '../domain/usecases/get_payments_usecase.dart' as _i16;
import '../domain/usecases/get_pin_sending_usecase.dart' as _i35;
import '../domain/usecases/get_profile_usecase.dart' as _i17;
import '../domain/usecases/invite_friend_usecase.dart' as _i24;
import '../domain/usecases/post_bookmark_addition_usecase.dart' as _i40;
import '../domain/usecases/post_bookmark_removal_usecase.dart' as _i42;
import '../domain/usecases/post_contact_selection_usecase.dart' as _i12;
import '../domain/usecases/post_password_creation_usecase.dart' as _i32;
import '../domain/usecases/post_pin_entry_usecase.dart' as _i34;
import '../domain/usecases/sign_in_usecase.dart' as _i37;
import '../domain/usecases/sign_up_usecase.dart' as _i38;
import '../domain/usecases/update_profile_usecase.dart' as _i39;
import '../module/register_module.dart' as _i64;
import '../presentation/account_setup/create_new_pin/bloc/create_new_pin_bloc.dart'
    as _i44;
import '../presentation/account_setup/fill_your_profile/bloc/fill_your_profile_bloc.dart'
    as _i45;
import '../presentation/edit_profile/bloc/edit_profile_bloc.dart' as _i61;
import '../presentation/forgot_and_reset_password/create_new_password/bloc/password_creation_bloc.dart'
    as _i55;
import '../presentation/forgot_and_reset_password/enter_pin/bloc/pin_entry_bloc.dart'
    as _i56;
import '../presentation/forgot_and_reset_password/select_contact/bloc/contact_selection_bloc.dart'
    as _i43;
import '../presentation/friends_invitation/bloc/friends_invitation_bloc.dart'
    as _i46;
import '../presentation/help_center/bloc/helper_center_bloc.dart' as _i50;
import '../presentation/home_and_action_menu/home/bloc/home_bloc.dart' as _i62;
import '../presentation/home_and_action_menu/my_bookmark/bloc/bookmark_bloc.dart'
    as _i60;
import '../presentation/home_and_action_menu/notification/bloc/notification_bloc.dart'
    as _i63;
import '../presentation/home_and_action_menu/top_mentors/bloc/top_mentors_bloc.dart'
    as _i59;
import '../presentation/language/bloc/language_bloc.dart' as _i52;
import '../presentation/letsin/signin/bloc/signin_bloc.dart' as _i57;
import '../presentation/letsin/signup/bloc/signup_bloc.dart' as _i58;
import '../presentation/new_card/bloc/new_card_bloc.dart' as _i28;
import '../presentation/payment/bloc/payment_bloc.dart' as _i33;
import '../presentation/profile/bloc/profile_bloc.dart'
    as _i36; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.Dio>(() => registerModule.apiDio, instanceName: 'ApiDio');
  gh.factory<String>(() => registerModule.apiBaseUrl,
      instanceName: 'ApiBaseUrl');
  gh.lazySingleton<_i4.UserApiService>(() => registerModule.userApiService(
      get<_i3.Dio>(instanceName: 'ApiDio'),
      get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i5.UserRepository>(
      () => _i6.UserRepositoryImpl(get<_i4.UserApiService>()));
  gh.factory<_i7.AddNewCardUseCase>(
      () => _i7.AddNewCardUseCase(get<_i5.UserRepository>()));
  gh.lazySingleton<_i8.BookmarkApiService>(() =>
      registerModule.bookmarkApiService(get<_i3.Dio>(instanceName: 'ApiDio'),
          get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i9.BookmarkRepository>(
      () => _i10.BookmarkRepositoryImpl(get<_i8.BookmarkApiService>()));
  gh.factory<_i11.ContactFetchUseCase>(
      () => _i11.ContactFetchUseCase(get<_i5.UserRepository>()));
  gh.factory<_i12.ContactSelectionUseCase>(
      () => _i12.ContactSelectionUseCase(get<_i5.UserRepository>()));
  gh.factory<_i13.CreateNewPinUseCase>(
      () => _i13.CreateNewPinUseCase(get<_i5.UserRepository>()));
  gh.factory<_i14.FillYourProfileUseCase>(
      () => _i14.FillYourProfileUseCase(get<_i5.UserRepository>()));
  gh.factory<_i15.GetInviteFriendsUseCase>(
      () => _i15.GetInviteFriendsUseCase(get<_i5.UserRepository>()));
  gh.factory<_i16.GetPaymentsUseCase>(
      () => _i16.GetPaymentsUseCase(get<_i5.UserRepository>()));
  gh.factory<_i17.GetProfileUseCase>(
      () => _i17.GetProfileUseCase(get<_i5.UserRepository>()));
  gh.lazySingleton<_i18.HelperApiService>(() => registerModule.helperApiService(
      get<_i3.Dio>(instanceName: 'ApiDio'),
      get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i19.HelperRepository>(
      () => _i20.HelperRepositoryImpl(get<_i18.HelperApiService>()));
  gh.lazySingleton<_i21.HomeApiService>(() => registerModule.homeApiService(
      get<_i3.Dio>(instanceName: 'ApiDio'),
      get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i22.HomeRepository>(
      () => _i23.HomeRepositoryImpl(get<_i21.HomeApiService>()));
  gh.factory<_i24.InviteFriendUseCase>(
      () => _i24.InviteFriendUseCase(get<_i5.UserRepository>()));
  gh.lazySingleton<_i25.MentorApiService>(() => registerModule.mentorApiService(
      get<_i3.Dio>(instanceName: 'ApiDio'),
      get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i26.MentorRepository>(
      () => _i27.MentorRepositoryImpl(get<_i25.MentorApiService>()));
  gh.factory<_i28.NewCardBloc>(
      () => _i28.NewCardBloc(get<_i7.AddNewCardUseCase>()));
  gh.lazySingleton<_i29.NotificationApiService>(() =>
      registerModule.notificationApiService(
          get<_i3.Dio>(instanceName: 'ApiDio'),
          get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i30.NotificationRepository>(() =>
      _i31.NotificationRepositoryImpl(get<_i29.NotificationApiService>()));
  gh.factory<_i32.PasswordCreationUseCase>(
      () => _i32.PasswordCreationUseCase(get<_i5.UserRepository>()));
  gh.factory<_i33.PaymentBloc>(
      () => _i33.PaymentBloc(get<_i16.GetPaymentsUseCase>()));
  gh.factory<_i34.PinEntryUseCase>(
      () => _i34.PinEntryUseCase(get<_i5.UserRepository>()));
  gh.factory<_i35.PinSendingUseCase>(
      () => _i35.PinSendingUseCase(get<_i5.UserRepository>()));
  gh.factory<_i36.ProfileBloc>(
      () => _i36.ProfileBloc(get<_i17.GetProfileUseCase>()));
  gh.factory<_i37.SignInUseCase>(
      () => _i37.SignInUseCase(get<_i5.UserRepository>()));
  gh.factory<_i38.SignUpUseCase>(
      () => _i38.SignUpUseCase(get<_i5.UserRepository>()));
  gh.factory<_i39.UpdateProfileUseCase>(
      () => _i39.UpdateProfileUseCase(get<_i5.UserRepository>()));
  gh.factory<_i40.BookmarkAdditionUseCase>(
      () => _i40.BookmarkAdditionUseCase(get<_i9.BookmarkRepository>()));
  gh.factory<_i41.BookmarkFetchUseCase>(
      () => _i41.BookmarkFetchUseCase(get<_i9.BookmarkRepository>()));
  gh.factory<_i42.BookmarkRemovalUseCase>(
      () => _i42.BookmarkRemovalUseCase(get<_i9.BookmarkRepository>()));
  gh.factory<_i43.ContactSelectionBloc>(() => _i43.ContactSelectionBloc(
      get<_i12.ContactSelectionUseCase>(), get<_i11.ContactFetchUseCase>()));
  gh.factory<_i44.CreateNewPinBloc>(
      () => _i44.CreateNewPinBloc(get<_i13.CreateNewPinUseCase>()));
  gh.factory<_i45.FillYourProfileBloc>(
      () => _i45.FillYourProfileBloc(get<_i14.FillYourProfileUseCase>()));
  gh.factory<_i46.FriendsInvitationBloc>(() => _i46.FriendsInvitationBloc(
      get<_i15.GetInviteFriendsUseCase>(), get<_i24.InviteFriendUseCase>()));
  gh.factory<_i47.GetCountriesUseCase>(
      () => _i47.GetCountriesUseCase(get<_i19.HelperRepository>()));
  gh.factory<_i48.GetHelperCenterUseCase>(
      () => _i48.GetHelperCenterUseCase(get<_i19.HelperRepository>()));
  gh.factory<_i49.GetLanguagesUseCase>(
      () => _i49.GetLanguagesUseCase(get<_i19.HelperRepository>()));
  gh.factory<_i50.HelperCenterBloc>(
      () => _i50.HelperCenterBloc(get<_i48.GetHelperCenterUseCase>()));
  gh.factory<_i51.HomeFetchUseCase>(
      () => _i51.HomeFetchUseCase(get<_i22.HomeRepository>()));
  gh.factory<_i52.LanguageBloc>(
      () => _i52.LanguageBloc(get<_i49.GetLanguagesUseCase>()));
  gh.factory<_i53.MentorFetchUseCase>(
      () => _i53.MentorFetchUseCase(get<_i26.MentorRepository>()));
  gh.factory<_i54.NotificationFetchUseCase>(
      () => _i54.NotificationFetchUseCase(get<_i30.NotificationRepository>()));
  gh.factory<_i55.PasswordCreationBloc>(
      () => _i55.PasswordCreationBloc(get<_i32.PasswordCreationUseCase>()));
  gh.factory<_i56.PinEntryBloc>(() => _i56.PinEntryBloc(
      get<_i35.PinSendingUseCase>(), get<_i34.PinEntryUseCase>()));
  gh.factory<_i57.SignInBloc>(() => _i57.SignInBloc(get<_i37.SignInUseCase>()));
  gh.factory<_i58.SignUpBloc>(() => _i58.SignUpBloc(get<_i38.SignUpUseCase>()));
  gh.factory<_i59.TopMentorsBloc>(
      () => _i59.TopMentorsBloc(get<_i53.MentorFetchUseCase>()));
  gh.factory<_i60.BookmarkBloc>(() => _i60.BookmarkBloc(
      get<_i41.BookmarkFetchUseCase>(), get<_i42.BookmarkRemovalUseCase>()));
  gh.factory<_i61.EditProfileBloc>(() => _i61.EditProfileBloc(
      get<_i47.GetCountriesUseCase>(), get<_i39.UpdateProfileUseCase>()));
  gh.factory<_i62.HomeBloc>(() => _i62.HomeBloc(get<_i51.HomeFetchUseCase>(),
      get<_i40.BookmarkAdditionUseCase>(), get<_i42.BookmarkRemovalUseCase>()));
  gh.factory<_i63.NotificationBloc>(
      () => _i63.NotificationBloc(get<_i54.NotificationFetchUseCase>()));
  return get;
}

class _$RegisterModule extends _i64.RegisterModule {}
