// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/nd_network/nd_network.dart' as _i3;
import '../data/datasources/remote/course_api_service.dart' as _i10;
import '../data/datasources/remote/helper_api_service.dart' as _i18;
import '../data/datasources/remote/home_api_service.dart' as _i21;
import '../data/datasources/remote/notification_api_service.dart' as _i26;
import '../data/datasources/remote/user_api_service.dart' as _i4;
import '../data/repositories/course_repository_impl.dart' as _i12;
import '../data/repositories/helper_repository_impl.dart' as _i20;
import '../data/repositories/home_repository_impl.dart' as _i23;
import '../data/repositories/notification_repository_impl.dart' as _i28;
import '../data/repositories/user_repository_impl.dart' as _i6;
import '../domain/repositories/course_repository.dart' as _i11;
import '../domain/repositories/helper_repository.dart' as _i19;
import '../domain/repositories/home_repository.dart' as _i22;
import '../domain/repositories/notification_repository.dart' as _i27;
import '../domain/repositories/user_repository.dart' as _i5;
import '../domain/usecases/add_new_card_usecase.dart' as _i7;
import '../domain/usecases/create_new_pin_usecase.dart' as _i13;
import '../domain/usecases/fill_your_profile_usecase.dart' as _i14;
import '../domain/usecases/get_contact_fetch_usecase.dart' as _i8;
import '../domain/usecases/get_countries_usecase.dart' as _i42;
import '../domain/usecases/get_course_list_usecase.dart' as _i38;
import '../domain/usecases/get_helper_center_usecase.dart' as _i43;
import '../domain/usecases/get_home_fetch_usecase.dart' as _i46;
import '../domain/usecases/get_invite_friends_usecase.dart' as _i15;
import '../domain/usecases/get_languages_usecase.dart' as _i44;
import '../domain/usecases/get_notification_fetch_usecase.dart' as _i48;
import '../domain/usecases/get_payments_usecase.dart' as _i16;
import '../domain/usecases/get_pin_sending_usecase.dart' as _i32;
import '../domain/usecases/get_profile_usecase.dart' as _i17;
import '../domain/usecases/invite_friend_usecase.dart' as _i24;
import '../domain/usecases/post_contact_selection_usecase.dart' as _i9;
import '../domain/usecases/post_password_creation_usecase.dart' as _i29;
import '../domain/usecases/post_pin_entry_usecase.dart' as _i31;
import '../domain/usecases/sign_in_usecase.dart' as _i34;
import '../domain/usecases/sign_up_usecase.dart' as _i35;
import '../domain/usecases/update_profile_usecase.dart' as _i36;
import '../module/register_module.dart' as _i56;
import '../presentation/account_setup/create_new_pin/bloc/create_new_pin_bloc.dart'
    as _i39;
import '../presentation/account_setup/fill_your_profile/bloc/fill_your_profile_bloc.dart'
    as _i40;
import '../presentation/edit_profile/bloc/edit_profile_bloc.dart' as _i53;
import '../presentation/forgot_and_reset_password/create_new_password/bloc/password_creation_bloc.dart'
    as _i49;
import '../presentation/forgot_and_reset_password/enter_pin/bloc/pin_entry_bloc.dart'
    as _i50;
import '../presentation/forgot_and_reset_password/select_contact/bloc/contact_selection_bloc.dart'
    as _i37;
import '../presentation/friends_invitation/bloc/friends_invitation_bloc.dart'
    as _i41;
import '../presentation/help_center/bloc/helper_center_bloc.dart' as _i45;
import '../presentation/home_and_action_menu/home/bloc/home_bloc.dart' as _i54;
import '../presentation/home_and_action_menu/notification/bloc/notification_bloc.dart'
    as _i55;
import '../presentation/language/bloc/language_bloc.dart' as _i47;
import '../presentation/letsin/signin/bloc/signin_bloc.dart' as _i51;
import '../presentation/letsin/signup/bloc/signup_bloc.dart' as _i52;
import '../presentation/new_card/bloc/new_card_bloc.dart' as _i25;
import '../presentation/payment/bloc/payment_bloc.dart' as _i30;
import '../presentation/profile/bloc/profile_bloc.dart'
    as _i33; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i8.ContactFetchUseCase>(
      () => _i8.ContactFetchUseCase(get<_i5.UserRepository>()));
  gh.factory<_i9.ContactSelectionUseCase>(
      () => _i9.ContactSelectionUseCase(get<_i5.UserRepository>()));
  gh.lazySingleton<_i10.CourseApiService>(() => registerModule.courseApiService(
      get<_i3.Dio>(instanceName: 'ApiDio'),
      get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i11.CourseRepository>(
      () => _i12.CourseRepositoryImpl(get<_i10.CourseApiService>()));
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
  gh.factory<_i25.NewCardBloc>(
      () => _i25.NewCardBloc(get<_i7.AddNewCardUseCase>()));
  gh.lazySingleton<_i26.NotificationApiService>(() =>
      registerModule.notificationApiService(
          get<_i3.Dio>(instanceName: 'ApiDio'),
          get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i27.NotificationRepository>(() =>
      _i28.NotificationRepositoryImpl(get<_i26.NotificationApiService>()));
  gh.factory<_i29.PasswordCreationUseCase>(
      () => _i29.PasswordCreationUseCase(get<_i5.UserRepository>()));
  gh.factory<_i30.PaymentBloc>(
      () => _i30.PaymentBloc(get<_i16.GetPaymentsUseCase>()));
  gh.factory<_i31.PinEntryUseCase>(
      () => _i31.PinEntryUseCase(get<_i5.UserRepository>()));
  gh.factory<_i32.PinSendingUseCase>(
      () => _i32.PinSendingUseCase(get<_i5.UserRepository>()));
  gh.factory<_i33.ProfileBloc>(
      () => _i33.ProfileBloc(get<_i17.GetProfileUseCase>()));
  gh.factory<_i34.SignInUseCase>(
      () => _i34.SignInUseCase(get<_i5.UserRepository>()));
  gh.factory<_i35.SignUpUseCase>(
      () => _i35.SignUpUseCase(get<_i5.UserRepository>()));
  gh.factory<_i36.UpdateProfileUseCase>(
      () => _i36.UpdateProfileUseCase(get<_i5.UserRepository>()));
  gh.factory<_i37.ContactSelectionBloc>(() => _i37.ContactSelectionBloc(
      get<_i9.ContactSelectionUseCase>(), get<_i8.ContactFetchUseCase>()));
  gh.factory<_i38.CourseFetchUseCase>(
      () => _i38.CourseFetchUseCase(get<_i11.CourseRepository>()));
  gh.factory<_i39.CreateNewPinBloc>(
      () => _i39.CreateNewPinBloc(get<_i13.CreateNewPinUseCase>()));
  gh.factory<_i40.FillYourProfileBloc>(
      () => _i40.FillYourProfileBloc(get<_i14.FillYourProfileUseCase>()));
  gh.factory<_i41.FriendsInvitationBloc>(() => _i41.FriendsInvitationBloc(
      get<_i15.GetInviteFriendsUseCase>(), get<_i24.InviteFriendUseCase>()));
  gh.factory<_i42.GetCountriesUseCase>(
      () => _i42.GetCountriesUseCase(get<_i19.HelperRepository>()));
  gh.factory<_i43.GetHelperCenterUseCase>(
      () => _i43.GetHelperCenterUseCase(get<_i19.HelperRepository>()));
  gh.factory<_i44.GetLanguagesUseCase>(
      () => _i44.GetLanguagesUseCase(get<_i19.HelperRepository>()));
  gh.factory<_i45.HelperCenterBloc>(
      () => _i45.HelperCenterBloc(get<_i43.GetHelperCenterUseCase>()));
  gh.factory<_i46.HomeFetchUseCase>(
      () => _i46.HomeFetchUseCase(get<_i22.HomeRepository>()));
  gh.factory<_i47.LanguageBloc>(
      () => _i47.LanguageBloc(get<_i44.GetLanguagesUseCase>()));
  gh.factory<_i48.NotificationFetchUseCase>(
      () => _i48.NotificationFetchUseCase(get<_i27.NotificationRepository>()));
  gh.factory<_i49.PasswordCreationBloc>(
      () => _i49.PasswordCreationBloc(get<_i29.PasswordCreationUseCase>()));
  gh.factory<_i50.PinEntryBloc>(() => _i50.PinEntryBloc(
      get<_i32.PinSendingUseCase>(), get<_i31.PinEntryUseCase>()));
  gh.factory<_i51.SignInBloc>(() => _i51.SignInBloc(get<_i34.SignInUseCase>()));
  gh.factory<_i52.SignUpBloc>(() => _i52.SignUpBloc(get<_i35.SignUpUseCase>()));
  gh.factory<_i53.EditProfileBloc>(() => _i53.EditProfileBloc(
      get<_i42.GetCountriesUseCase>(), get<_i36.UpdateProfileUseCase>()));
  gh.factory<_i54.HomeBloc>(() => _i54.HomeBloc(
      get<_i38.CourseFetchUseCase>(), get<_i46.HomeFetchUseCase>()));
  gh.factory<_i55.NotificationBloc>(
      () => _i55.NotificationBloc(get<_i48.NotificationFetchUseCase>()));
  return get;
}

class _$RegisterModule extends _i56.RegisterModule {}
