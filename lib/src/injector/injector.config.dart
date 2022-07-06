// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/nd_network/nd_network.dart' as _i3;
import '../data/datasources/remote/helper_api_service.dart' as _i13;
import '../data/datasources/remote/user_api_service.dart' as _i4;
import '../data/repositories/helper_repository_impl.dart' as _i15;
import '../data/repositories/user_repository_impl.dart' as _i6;
import '../domain/repositories/helper_repository.dart' as _i14;
import '../domain/repositories/user_repository.dart' as _i5;
import '../domain/usecases/add_new_card_usecase.dart' as _i7;
import '../domain/usecases/create_new_pin_usecase.dart' as _i8;
import '../domain/usecases/fill_your_profile_usecase.dart' as _i9;
import '../domain/usecases/get_countries_usecase.dart' as _i26;
import '../domain/usecases/get_helper_center_usecase.dart' as _i27;
import '../domain/usecases/get_invite_friends_usecase.dart' as _i10;
import '../domain/usecases/get_languages_usecase.dart' as _i28;
import '../domain/usecases/get_payments_usecase.dart' as _i11;
import '../domain/usecases/get_profile_usecase.dart' as _i12;
import '../domain/usecases/invite_friend_usecase.dart' as _i16;
import '../domain/usecases/sign_in_usecase.dart' as _i20;
import '../domain/usecases/sign_up_usecase.dart' as _i21;
import '../domain/usecases/update_profile_usecase.dart' as _i22;
import '../module/register_module.dart' as _i33;
import '../presentation/account_setup/create_new_pin/bloc/create_new_pin_bloc.dart'
    as _i23;
import '../presentation/account_setup/fill_your_profile/bloc/fill_your_profile_bloc.dart'
    as _i24;
import '../presentation/edit_profile/bloc/edit_profile_bloc.dart' as _i32;
import '../presentation/friends_invitation/bloc/friends_invitation_bloc.dart'
    as _i25;
import '../presentation/help_center/bloc/helper_center_bloc.dart' as _i29;
import '../presentation/language/bloc/language_bloc.dart' as _i30;
import '../presentation/letsin/signin/bloc/signin_bloc.dart' as _i31;
import '../presentation/new_card/bloc/new_card_bloc.dart' as _i17;
import '../presentation/payment/bloc/payment_bloc.dart' as _i18;
import '../presentation/profile/bloc/profile_bloc.dart'
    as _i19; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i8.CreateNewPinUseCase>(
      () => _i8.CreateNewPinUseCase(get<_i5.UserRepository>()));
  gh.factory<_i9.FillYourProfileUseCase>(
      () => _i9.FillYourProfileUseCase(get<_i5.UserRepository>()));
  gh.factory<_i10.GetInviteFriendsUseCase>(
      () => _i10.GetInviteFriendsUseCase(get<_i5.UserRepository>()));
  gh.factory<_i11.GetPaymentsUseCase>(
      () => _i11.GetPaymentsUseCase(get<_i5.UserRepository>()));
  gh.factory<_i12.GetProfileUseCase>(
      () => _i12.GetProfileUseCase(get<_i5.UserRepository>()));
  gh.lazySingleton<_i13.HelperApiService>(() => registerModule.helperApiService(
      get<_i3.Dio>(instanceName: 'ApiDio'),
      get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i14.HelperRepository>(
      () => _i15.HelperRepositoryImpl(get<_i13.HelperApiService>()));
  gh.factory<_i16.InviteFriendUseCase>(
      () => _i16.InviteFriendUseCase(get<_i5.UserRepository>()));
  gh.factory<_i17.NewCardBloc>(
      () => _i17.NewCardBloc(get<_i7.AddNewCardUseCase>()));
  gh.factory<_i18.PaymentBloc>(
      () => _i18.PaymentBloc(get<_i11.GetPaymentsUseCase>()));
  gh.factory<_i19.ProfileBloc>(
      () => _i19.ProfileBloc(get<_i12.GetProfileUseCase>()));
  gh.factory<_i20.SignInUseCase>(
      () => _i20.SignInUseCase(get<_i5.UserRepository>()));
  gh.factory<_i21.SignUpUseCase>(
      () => _i21.SignUpUseCase(get<_i5.UserRepository>()));
  gh.factory<_i22.UpdateProfileUseCase>(
      () => _i22.UpdateProfileUseCase(get<_i5.UserRepository>()));
  gh.factory<_i23.CreateNewPinBloc>(
      () => _i23.CreateNewPinBloc(get<_i8.CreateNewPinUseCase>()));
  gh.factory<_i24.FillYourProfileBloc>(
      () => _i24.FillYourProfileBloc(get<_i9.FillYourProfileUseCase>()));
  gh.factory<_i25.FriendsInvitationBloc>(() => _i25.FriendsInvitationBloc(
      get<_i10.GetInviteFriendsUseCase>(), get<_i16.InviteFriendUseCase>()));
  gh.factory<_i26.GetCountriesUseCase>(
      () => _i26.GetCountriesUseCase(get<_i14.HelperRepository>()));
  gh.factory<_i27.GetHelperCenterUseCase>(
      () => _i27.GetHelperCenterUseCase(get<_i14.HelperRepository>()));
  gh.factory<_i28.GetLanguagesUseCase>(
      () => _i28.GetLanguagesUseCase(get<_i14.HelperRepository>()));
  gh.factory<_i29.HelperCenterBloc>(
      () => _i29.HelperCenterBloc(get<_i27.GetHelperCenterUseCase>()));
  gh.factory<_i30.LanguageBloc>(
      () => _i30.LanguageBloc(get<_i28.GetLanguagesUseCase>()));
  gh.factory<_i31.SignInBloc>(() => _i31.SignInBloc(get<_i20.SignInUseCase>()));
  gh.factory<_i32.EditProfileBloc>(() => _i32.EditProfileBloc(
      get<_i26.GetCountriesUseCase>(), get<_i22.UpdateProfileUseCase>()));
  return get;
}

class _$RegisterModule extends _i33.RegisterModule {}
