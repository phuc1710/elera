// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/nd_network/nd_network.dart' as _i3;
import '../data/datasources/remote/bookmark_api_service.dart' as _i8;
import '../data/datasources/remote/course_api_service.dart' as _i13;
import '../data/datasources/remote/helper_api_service.dart' as _i19;
import '../data/datasources/remote/home_api_service.dart' as _i22;
import '../data/datasources/remote/notification_api_service.dart' as _i27;
import '../data/datasources/remote/user_api_service.dart' as _i4;
import '../data/repositories/bookmark_repository_impl.dart' as _i10;
import '../data/repositories/helper_repository_impl.dart' as _i21;
import '../data/repositories/home_repository_impl.dart' as _i24;
import '../data/repositories/notification_repository_impl.dart' as _i29;
import '../data/repositories/user_repository_impl.dart' as _i6;
import '../domain/repositories/bookmark_repository.dart' as _i9;
import '../domain/repositories/helper_repository.dart' as _i20;
import '../domain/repositories/home_repository.dart' as _i23;
import '../domain/repositories/notification_repository.dart' as _i28;
import '../domain/repositories/user_repository.dart' as _i5;
import '../domain/usecases/add_new_card_usecase.dart' as _i7;
import '../domain/usecases/create_new_pin_usecase.dart' as _i14;
import '../domain/usecases/fill_your_profile_usecase.dart' as _i15;
import '../domain/usecases/get_bookmark_fetch_usecase.dart' as _i39;
import '../domain/usecases/get_contact_fetch_usecase.dart' as _i11;
import '../domain/usecases/get_countries_usecase.dart' as _i45;
import '../domain/usecases/get_helper_center_usecase.dart' as _i46;
import '../domain/usecases/get_home_fetch_usecase.dart' as _i49;
import '../domain/usecases/get_invite_friends_usecase.dart' as _i16;
import '../domain/usecases/get_languages_usecase.dart' as _i47;
import '../domain/usecases/get_notification_fetch_usecase.dart' as _i51;
import '../domain/usecases/get_payments_usecase.dart' as _i17;
import '../domain/usecases/get_pin_sending_usecase.dart' as _i33;
import '../domain/usecases/get_profile_usecase.dart' as _i18;
import '../domain/usecases/invite_friend_usecase.dart' as _i25;
import '../domain/usecases/post_bookmark_addition_usecase.dart' as _i38;
import '../domain/usecases/post_bookmark_removal_usecase.dart' as _i40;
import '../domain/usecases/post_contact_selection_usecase.dart' as _i12;
import '../domain/usecases/post_password_creation_usecase.dart' as _i30;
import '../domain/usecases/post_pin_entry_usecase.dart' as _i32;
import '../domain/usecases/sign_in_usecase.dart' as _i35;
import '../domain/usecases/sign_up_usecase.dart' as _i36;
import '../domain/usecases/update_profile_usecase.dart' as _i37;
import '../module/register_module.dart' as _i60;
import '../presentation/account_setup/create_new_pin/bloc/create_new_pin_bloc.dart'
    as _i42;
import '../presentation/account_setup/fill_your_profile/bloc/fill_your_profile_bloc.dart'
    as _i43;
import '../presentation/edit_profile/bloc/edit_profile_bloc.dart' as _i57;
import '../presentation/forgot_and_reset_password/create_new_password/bloc/password_creation_bloc.dart'
    as _i52;
import '../presentation/forgot_and_reset_password/enter_pin/bloc/pin_entry_bloc.dart'
    as _i53;
import '../presentation/forgot_and_reset_password/select_contact/bloc/contact_selection_bloc.dart'
    as _i41;
import '../presentation/friends_invitation/bloc/friends_invitation_bloc.dart'
    as _i44;
import '../presentation/help_center/bloc/helper_center_bloc.dart' as _i48;
import '../presentation/home_and_action_menu/home/bloc/home_bloc.dart' as _i58;
import '../presentation/home_and_action_menu/my_bookmark/bloc/bookmark_bloc.dart'
    as _i56;
import '../presentation/home_and_action_menu/notification/bloc/notification_bloc.dart'
    as _i59;
import '../presentation/language/bloc/language_bloc.dart' as _i50;
import '../presentation/letsin/signin/bloc/signin_bloc.dart' as _i54;
import '../presentation/letsin/signup/bloc/signup_bloc.dart' as _i55;
import '../presentation/new_card/bloc/new_card_bloc.dart' as _i26;
import '../presentation/payment/bloc/payment_bloc.dart' as _i31;
import '../presentation/profile/bloc/profile_bloc.dart'
    as _i34; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i13.CourseApiService>(() => registerModule.courseApiService(
      get<_i3.Dio>(instanceName: 'ApiDio'),
      get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i14.CreateNewPinUseCase>(
      () => _i14.CreateNewPinUseCase(get<_i5.UserRepository>()));
  gh.factory<_i15.FillYourProfileUseCase>(
      () => _i15.FillYourProfileUseCase(get<_i5.UserRepository>()));
  gh.factory<_i16.GetInviteFriendsUseCase>(
      () => _i16.GetInviteFriendsUseCase(get<_i5.UserRepository>()));
  gh.factory<_i17.GetPaymentsUseCase>(
      () => _i17.GetPaymentsUseCase(get<_i5.UserRepository>()));
  gh.factory<_i18.GetProfileUseCase>(
      () => _i18.GetProfileUseCase(get<_i5.UserRepository>()));
  gh.lazySingleton<_i19.HelperApiService>(() => registerModule.helperApiService(
      get<_i3.Dio>(instanceName: 'ApiDio'),
      get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i20.HelperRepository>(
      () => _i21.HelperRepositoryImpl(get<_i19.HelperApiService>()));
  gh.lazySingleton<_i22.HomeApiService>(() => registerModule.homeApiService(
      get<_i3.Dio>(instanceName: 'ApiDio'),
      get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i23.HomeRepository>(
      () => _i24.HomeRepositoryImpl(get<_i22.HomeApiService>()));
  gh.factory<_i25.InviteFriendUseCase>(
      () => _i25.InviteFriendUseCase(get<_i5.UserRepository>()));
  gh.factory<_i26.NewCardBloc>(
      () => _i26.NewCardBloc(get<_i7.AddNewCardUseCase>()));
  gh.lazySingleton<_i27.NotificationApiService>(() =>
      registerModule.notificationApiService(
          get<_i3.Dio>(instanceName: 'ApiDio'),
          get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i28.NotificationRepository>(() =>
      _i29.NotificationRepositoryImpl(get<_i27.NotificationApiService>()));
  gh.factory<_i30.PasswordCreationUseCase>(
      () => _i30.PasswordCreationUseCase(get<_i5.UserRepository>()));
  gh.factory<_i31.PaymentBloc>(
      () => _i31.PaymentBloc(get<_i17.GetPaymentsUseCase>()));
  gh.factory<_i32.PinEntryUseCase>(
      () => _i32.PinEntryUseCase(get<_i5.UserRepository>()));
  gh.factory<_i33.PinSendingUseCase>(
      () => _i33.PinSendingUseCase(get<_i5.UserRepository>()));
  gh.factory<_i34.ProfileBloc>(
      () => _i34.ProfileBloc(get<_i18.GetProfileUseCase>()));
  gh.factory<_i35.SignInUseCase>(
      () => _i35.SignInUseCase(get<_i5.UserRepository>()));
  gh.factory<_i36.SignUpUseCase>(
      () => _i36.SignUpUseCase(get<_i5.UserRepository>()));
  gh.factory<_i37.UpdateProfileUseCase>(
      () => _i37.UpdateProfileUseCase(get<_i5.UserRepository>()));
  gh.factory<_i38.BookmarkAdditionUseCase>(
      () => _i38.BookmarkAdditionUseCase(get<_i9.BookmarkRepository>()));
  gh.factory<_i39.BookmarkFetchUseCase>(
      () => _i39.BookmarkFetchUseCase(get<_i9.BookmarkRepository>()));
  gh.factory<_i40.BookmarkRemovalUseCase>(
      () => _i40.BookmarkRemovalUseCase(get<_i9.BookmarkRepository>()));
  gh.factory<_i41.ContactSelectionBloc>(() => _i41.ContactSelectionBloc(
      get<_i12.ContactSelectionUseCase>(), get<_i11.ContactFetchUseCase>()));
  gh.factory<_i42.CreateNewPinBloc>(
      () => _i42.CreateNewPinBloc(get<_i14.CreateNewPinUseCase>()));
  gh.factory<_i43.FillYourProfileBloc>(
      () => _i43.FillYourProfileBloc(get<_i15.FillYourProfileUseCase>()));
  gh.factory<_i44.FriendsInvitationBloc>(() => _i44.FriendsInvitationBloc(
      get<_i16.GetInviteFriendsUseCase>(), get<_i25.InviteFriendUseCase>()));
  gh.factory<_i45.GetCountriesUseCase>(
      () => _i45.GetCountriesUseCase(get<_i20.HelperRepository>()));
  gh.factory<_i46.GetHelperCenterUseCase>(
      () => _i46.GetHelperCenterUseCase(get<_i20.HelperRepository>()));
  gh.factory<_i47.GetLanguagesUseCase>(
      () => _i47.GetLanguagesUseCase(get<_i20.HelperRepository>()));
  gh.factory<_i48.HelperCenterBloc>(
      () => _i48.HelperCenterBloc(get<_i46.GetHelperCenterUseCase>()));
  gh.factory<_i49.HomeFetchUseCase>(
      () => _i49.HomeFetchUseCase(get<_i23.HomeRepository>()));
  gh.factory<_i50.LanguageBloc>(
      () => _i50.LanguageBloc(get<_i47.GetLanguagesUseCase>()));
  gh.factory<_i51.NotificationFetchUseCase>(
      () => _i51.NotificationFetchUseCase(get<_i28.NotificationRepository>()));
  gh.factory<_i52.PasswordCreationBloc>(
      () => _i52.PasswordCreationBloc(get<_i30.PasswordCreationUseCase>()));
  gh.factory<_i53.PinEntryBloc>(() => _i53.PinEntryBloc(
      get<_i33.PinSendingUseCase>(), get<_i32.PinEntryUseCase>()));
  gh.factory<_i54.SignInBloc>(() => _i54.SignInBloc(get<_i35.SignInUseCase>()));
  gh.factory<_i55.SignUpBloc>(() => _i55.SignUpBloc(get<_i36.SignUpUseCase>()));
  gh.factory<_i56.BookmarkBloc>(() => _i56.BookmarkBloc(
      get<_i39.BookmarkFetchUseCase>(), get<_i40.BookmarkRemovalUseCase>()));
  gh.factory<_i57.EditProfileBloc>(() => _i57.EditProfileBloc(
      get<_i45.GetCountriesUseCase>(), get<_i37.UpdateProfileUseCase>()));
  gh.factory<_i58.HomeBloc>(() => _i58.HomeBloc(get<_i49.HomeFetchUseCase>(),
      get<_i38.BookmarkAdditionUseCase>(), get<_i40.BookmarkRemovalUseCase>()));
  gh.factory<_i59.NotificationBloc>(
      () => _i59.NotificationBloc(get<_i51.NotificationFetchUseCase>()));
  return get;
}

class _$RegisterModule extends _i60.RegisterModule {}
