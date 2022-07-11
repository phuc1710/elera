// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/nd_network/nd_network.dart' as _i3;
import '../data/datasources/remote/helper_api_service.dart' as _i15;
import '../data/datasources/remote/user_api_service.dart' as _i4;
import '../data/repositories/helper_repository_impl.dart' as _i17;
import '../data/repositories/user_repository_impl.dart' as _i6;
import '../domain/repositories/helper_repository.dart' as _i16;
import '../domain/repositories/user_repository.dart' as _i5;
import '../domain/usecases/add_new_card_usecase.dart' as _i7;
import '../domain/usecases/create_new_pin_usecase.dart' as _i10;
import '../domain/usecases/fill_your_profile_usecase.dart' as _i11;
import '../domain/usecases/get_contact_fetch_usecase.dart' as _i8;
import '../domain/usecases/get_countries_usecase.dart' as _i31;
import '../domain/usecases/get_helper_center_usecase.dart' as _i32;
import '../domain/usecases/get_invite_friends_usecase.dart' as _i12;
import '../domain/usecases/get_languages_usecase.dart' as _i33;
import '../domain/usecases/get_payments_usecase.dart' as _i13;
import '../domain/usecases/get_pin_sending_usecase.dart' as _i22;
import '../domain/usecases/get_profile_usecase.dart' as _i14;
import '../domain/usecases/invite_friend_usecase.dart' as _i18;
import '../domain/usecases/post_contact_selection_usecase.dart' as _i9;
import '../domain/usecases/post_pin_entry_usecase.dart' as _i21;
import '../domain/usecases/sign_in_usecase.dart' as _i24;
import '../domain/usecases/sign_up_usecase.dart' as _i25;
import '../domain/usecases/update_profile_usecase.dart' as _i26;
import '../module/register_module.dart' as _i40;
import '../presentation/account_setup/create_new_pin/bloc/create_new_pin_bloc.dart'
    as _i28;
import '../presentation/account_setup/fill_your_profile/bloc/fill_your_profile_bloc.dart'
    as _i29;
import '../presentation/edit_profile/bloc/edit_profile_bloc.dart' as _i39;
import '../presentation/forgot_and_reset_password/enter_pin/bloc/pin_entry_bloc.dart'
    as _i36;
import '../presentation/forgot_and_reset_password/select_contact/bloc/contact_selection_bloc.dart'
    as _i27;
import '../presentation/friends_invitation/bloc/friends_invitation_bloc.dart'
    as _i30;
import '../presentation/help_center/bloc/helper_center_bloc.dart' as _i34;
import '../presentation/language/bloc/language_bloc.dart' as _i35;
import '../presentation/letsin/signin/bloc/signin_bloc.dart' as _i37;
import '../presentation/letsin/signup/bloc/signup_bloc.dart' as _i38;
import '../presentation/new_card/bloc/new_card_bloc.dart' as _i19;
import '../presentation/payment/bloc/payment_bloc.dart' as _i20;
import '../presentation/profile/bloc/profile_bloc.dart'
    as _i23; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i10.CreateNewPinUseCase>(
      () => _i10.CreateNewPinUseCase(get<_i5.UserRepository>()));
  gh.factory<_i11.FillYourProfileUseCase>(
      () => _i11.FillYourProfileUseCase(get<_i5.UserRepository>()));
  gh.factory<_i12.GetInviteFriendsUseCase>(
      () => _i12.GetInviteFriendsUseCase(get<_i5.UserRepository>()));
  gh.factory<_i13.GetPaymentsUseCase>(
      () => _i13.GetPaymentsUseCase(get<_i5.UserRepository>()));
  gh.factory<_i14.GetProfileUseCase>(
      () => _i14.GetProfileUseCase(get<_i5.UserRepository>()));
  gh.lazySingleton<_i15.HelperApiService>(() => registerModule.helperApiService(
      get<_i3.Dio>(instanceName: 'ApiDio'),
      get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i16.HelperRepository>(
      () => _i17.HelperRepositoryImpl(get<_i15.HelperApiService>()));
  gh.factory<_i18.InviteFriendUseCase>(
      () => _i18.InviteFriendUseCase(get<_i5.UserRepository>()));
  gh.factory<_i19.NewCardBloc>(
      () => _i19.NewCardBloc(get<_i7.AddNewCardUseCase>()));
  gh.factory<_i20.PaymentBloc>(
      () => _i20.PaymentBloc(get<_i13.GetPaymentsUseCase>()));
  gh.factory<_i21.PinEntryUseCase>(
      () => _i21.PinEntryUseCase(get<_i5.UserRepository>()));
  gh.factory<_i22.PinSendingUseCase>(
      () => _i22.PinSendingUseCase(get<_i5.UserRepository>()));
  gh.factory<_i23.ProfileBloc>(
      () => _i23.ProfileBloc(get<_i14.GetProfileUseCase>()));
  gh.factory<_i24.SignInUseCase>(
      () => _i24.SignInUseCase(get<_i5.UserRepository>()));
  gh.factory<_i25.SignUpUseCase>(
      () => _i25.SignUpUseCase(get<_i5.UserRepository>()));
  gh.factory<_i26.UpdateProfileUseCase>(
      () => _i26.UpdateProfileUseCase(get<_i5.UserRepository>()));
  gh.factory<_i27.ContactSelectionBloc>(() => _i27.ContactSelectionBloc(
      get<_i9.ContactSelectionUseCase>(), get<_i8.ContactFetchUseCase>()));
  gh.factory<_i28.CreateNewPinBloc>(
      () => _i28.CreateNewPinBloc(get<_i10.CreateNewPinUseCase>()));
  gh.factory<_i29.FillYourProfileBloc>(
      () => _i29.FillYourProfileBloc(get<_i11.FillYourProfileUseCase>()));
  gh.factory<_i30.FriendsInvitationBloc>(() => _i30.FriendsInvitationBloc(
      get<_i12.GetInviteFriendsUseCase>(), get<_i18.InviteFriendUseCase>()));
  gh.factory<_i31.GetCountriesUseCase>(
      () => _i31.GetCountriesUseCase(get<_i16.HelperRepository>()));
  gh.factory<_i32.GetHelperCenterUseCase>(
      () => _i32.GetHelperCenterUseCase(get<_i16.HelperRepository>()));
  gh.factory<_i33.GetLanguagesUseCase>(
      () => _i33.GetLanguagesUseCase(get<_i16.HelperRepository>()));
  gh.factory<_i34.HelperCenterBloc>(
      () => _i34.HelperCenterBloc(get<_i32.GetHelperCenterUseCase>()));
  gh.factory<_i35.LanguageBloc>(
      () => _i35.LanguageBloc(get<_i33.GetLanguagesUseCase>()));
  gh.factory<_i36.PinEntryBloc>(() => _i36.PinEntryBloc(
      get<_i22.PinSendingUseCase>(), get<_i21.PinEntryUseCase>()));
  gh.factory<_i37.SignInBloc>(() => _i37.SignInBloc(get<_i24.SignInUseCase>()));
  gh.factory<_i38.SignUpBloc>(() => _i38.SignUpBloc(get<_i25.SignUpUseCase>()));
  gh.factory<_i39.EditProfileBloc>(() => _i39.EditProfileBloc(
      get<_i31.GetCountriesUseCase>(), get<_i26.UpdateProfileUseCase>()));
  return get;
}

class _$RegisterModule extends _i40.RegisterModule {}
