// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/nd_network/nd_network.dart' as _i3;
import '../data/datasources/remote/helper_api_service.dart' as _i11;
import '../data/datasources/remote/user_api_service.dart' as _i4;
import '../data/repositories/helper_repository_impl.dart' as _i13;
import '../data/repositories/user_repository_impl.dart' as _i6;
import '../domain/repositories/helper_repository.dart' as _i12;
import '../domain/repositories/user_repository.dart' as _i5;
import '../domain/usecases/add_new_card_usecase.dart' as _i7;
import '../domain/usecases/get_countries_usecase.dart' as _i22;
import '../domain/usecases/get_helper_center_usecase.dart' as _i23;
import '../domain/usecases/get_invite_friends_usecase.dart' as _i8;
import '../domain/usecases/get_languages_usecase.dart' as _i24;
import '../domain/usecases/get_payments_usecase.dart' as _i9;
import '../domain/usecases/get_profile_usecase.dart' as _i10;
import '../domain/usecases/invite_friend_usecase.dart' as _i14;
import '../domain/usecases/sign_in_usecase.dart' as _i18;
import '../domain/usecases/sign_up_usecase.dart' as _i19;
import '../domain/usecases/update_profile_usecase.dart' as _i20;
import '../module/register_module.dart' as _i29;
import '../presentation/edit_profile/bloc/edit_profile_bloc.dart' as _i28;
import '../presentation/friends_invitation/bloc/friends_invitation_bloc.dart'
    as _i21;
import '../presentation/help_center/bloc/helper_center_bloc.dart' as _i25;
import '../presentation/language/bloc/language_bloc.dart' as _i26;
import '../presentation/letsin/signin/bloc/signin_bloc.dart' as _i27;
import '../presentation/new_card/bloc/new_card_bloc.dart' as _i15;
import '../presentation/payment/bloc/payment_bloc.dart' as _i16;
import '../presentation/profile/bloc/profile_bloc.dart'
    as _i17; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i8.GetInviteFriendsUseCase>(
      () => _i8.GetInviteFriendsUseCase(get<_i5.UserRepository>()));
  gh.factory<_i9.GetPaymentsUseCase>(
      () => _i9.GetPaymentsUseCase(get<_i5.UserRepository>()));
  gh.factory<_i10.GetProfileUseCase>(
      () => _i10.GetProfileUseCase(get<_i5.UserRepository>()));
  gh.lazySingleton<_i11.HelperApiService>(() => registerModule.helperApiService(
      get<_i3.Dio>(instanceName: 'ApiDio'),
      get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i12.HelperRepository>(
      () => _i13.HelperRepositoryImpl(get<_i11.HelperApiService>()));
  gh.factory<_i14.InviteFriendUseCase>(
      () => _i14.InviteFriendUseCase(get<_i5.UserRepository>()));
  gh.factory<_i15.NewCardBloc>(
      () => _i15.NewCardBloc(get<_i7.AddNewCardUseCase>()));
  gh.factory<_i16.PaymentBloc>(
      () => _i16.PaymentBloc(get<_i9.GetPaymentsUseCase>()));
  gh.factory<_i17.ProfileBloc>(
      () => _i17.ProfileBloc(get<_i10.GetProfileUseCase>()));
  gh.factory<_i18.SignInUseCase>(
      () => _i18.SignInUseCase(get<_i5.UserRepository>()));
  gh.factory<_i19.SignUpUseCase>(
      () => _i19.SignUpUseCase(get<_i5.UserRepository>()));
  gh.factory<_i20.UpdateProfileUseCase>(
      () => _i20.UpdateProfileUseCase(get<_i5.UserRepository>()));
  gh.factory<_i21.FriendsInvitationBloc>(() => _i21.FriendsInvitationBloc(
      get<_i8.GetInviteFriendsUseCase>(), get<_i14.InviteFriendUseCase>()));
  gh.factory<_i22.GetCountriesUseCase>(
      () => _i22.GetCountriesUseCase(get<_i12.HelperRepository>()));
  gh.factory<_i23.GetHelperCenterUseCase>(
      () => _i23.GetHelperCenterUseCase(get<_i12.HelperRepository>()));
  gh.factory<_i24.GetLanguagesUseCase>(
      () => _i24.GetLanguagesUseCase(get<_i12.HelperRepository>()));
  gh.factory<_i25.HelperCenterBloc>(
      () => _i25.HelperCenterBloc(get<_i23.GetHelperCenterUseCase>()));
  gh.factory<_i26.LanguageBloc>(
      () => _i26.LanguageBloc(get<_i24.GetLanguagesUseCase>()));
  gh.factory<_i27.SignInBloc>(() => _i27.SignInBloc(get<_i18.SignInUseCase>()));
  gh.factory<_i28.EditProfileBloc>(() => _i28.EditProfileBloc(
      get<_i22.GetCountriesUseCase>(), get<_i20.UpdateProfileUseCase>()));
  return get;
}

class _$RegisterModule extends _i29.RegisterModule {}
