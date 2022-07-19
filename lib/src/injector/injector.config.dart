// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/nd_network/nd_network.dart' as _i3;
import '../data/datasources/remote/bookmark_api_service.dart' as _i8;
import '../data/datasources/remote/course_api_service.dart' as _i13;
import '../data/datasources/remote/helper_api_service.dart' as _i21;
import '../data/datasources/remote/home_api_service.dart' as _i24;
import '../data/datasources/remote/mentor_api_service.dart' as _i28;
import '../data/datasources/remote/notification_api_service.dart' as _i32;
import '../data/datasources/remote/user_api_service.dart' as _i4;
import '../data/repositories/bookmark_repository_impl.dart' as _i10;
import '../data/repositories/courses_repository_impl.dart' as _i15;
import '../data/repositories/helper_repository_impl.dart' as _i23;
import '../data/repositories/home_repository_impl.dart' as _i26;
import '../data/repositories/mentor_repository_impl.dart' as _i30;
import '../data/repositories/notification_repository_impl.dart' as _i34;
import '../data/repositories/user_repository_impl.dart' as _i6;
import '../domain/repositories/bookmark_repository.dart' as _i9;
import '../domain/repositories/course_repository.dart' as _i14;
import '../domain/repositories/helper_repository.dart' as _i22;
import '../domain/repositories/home_repository.dart' as _i25;
import '../domain/repositories/mentor_repository.dart' as _i29;
import '../domain/repositories/notification_repository.dart' as _i33;
import '../domain/repositories/user_repository.dart' as _i5;
import '../domain/usecases/add_new_card_usecase.dart' as _i7;
import '../domain/usecases/create_new_pin_usecase.dart' as _i16;
import '../domain/usecases/fill_your_profile_usecase.dart' as _i17;
import '../domain/usecases/get_bookmark_fetch_usecase.dart' as _i44;
import '../domain/usecases/get_contact_fetch_usecase.dart' as _i11;
import '../domain/usecases/get_countries_usecase.dart' as _i51;
import '../domain/usecases/get_course_fetch_usecase.dart' as _i47;
import '../domain/usecases/get_helper_center_usecase.dart' as _i52;
import '../domain/usecases/get_home_fetch_usecase.dart' as _i55;
import '../domain/usecases/get_invite_friends_usecase.dart' as _i18;
import '../domain/usecases/get_languages_usecase.dart' as _i53;
import '../domain/usecases/get_mentor_fetch_usecase.dart' as _i57;
import '../domain/usecases/get_notification_fetch_usecase.dart' as _i58;
import '../domain/usecases/get_payments_usecase.dart' as _i19;
import '../domain/usecases/get_pin_sending_usecase.dart' as _i38;
import '../domain/usecases/get_profile_usecase.dart' as _i20;
import '../domain/usecases/invite_friend_usecase.dart' as _i27;
import '../domain/usecases/post_bookmark_addition_usecase.dart' as _i43;
import '../domain/usecases/post_bookmark_removal_usecase.dart' as _i45;
import '../domain/usecases/post_contact_selection_usecase.dart' as _i12;
import '../domain/usecases/post_password_creation_usecase.dart' as _i35;
import '../domain/usecases/post_pin_entry_usecase.dart' as _i37;
import '../domain/usecases/sign_in_usecase.dart' as _i40;
import '../domain/usecases/sign_up_usecase.dart' as _i41;
import '../domain/usecases/update_profile_usecase.dart' as _i42;
import '../module/register_module.dart' as _i69;
import '../presentation/account_setup/create_new_pin/bloc/create_new_pin_bloc.dart'
    as _i48;
import '../presentation/account_setup/fill_your_profile/bloc/fill_your_profile_bloc.dart'
    as _i49;
import '../presentation/edit_profile/bloc/edit_profile_bloc.dart' as _i66;
import '../presentation/forgot_and_reset_password/create_new_password/bloc/password_creation_bloc.dart'
    as _i59;
import '../presentation/forgot_and_reset_password/enter_pin/bloc/pin_entry_bloc.dart'
    as _i60;
import '../presentation/forgot_and_reset_password/select_contact/bloc/contact_selection_bloc.dart'
    as _i46;
import '../presentation/friends_invitation/bloc/friends_invitation_bloc.dart'
    as _i50;
import '../presentation/help_center/bloc/helper_center_bloc.dart' as _i54;
import '../presentation/home_and_action_menu/home/bloc/home_bloc.dart' as _i67;
import '../presentation/home_and_action_menu/most_popular_courses/bloc/course_bloc.dart'
    as _i65;
import '../presentation/home_and_action_menu/my_bookmark/bloc/bookmark_bloc.dart'
    as _i64;
import '../presentation/home_and_action_menu/notification/bloc/notification_bloc.dart'
    as _i68;
import '../presentation/home_and_action_menu/top_mentors/bloc/top_mentors_bloc.dart'
    as _i63;
import '../presentation/language/bloc/language_bloc.dart' as _i56;
import '../presentation/letsin/signin/bloc/signin_bloc.dart' as _i61;
import '../presentation/letsin/signup/bloc/signup_bloc.dart' as _i62;
import '../presentation/new_card/bloc/new_card_bloc.dart' as _i31;
import '../presentation/payment/bloc/payment_bloc.dart' as _i36;
import '../presentation/profile/bloc/profile_bloc.dart'
    as _i39; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i14.CourseRepository>(
      () => _i15.CourseRepositoryImpl(get<_i13.CourseApiService>()));
  gh.factory<_i16.CreateNewPinUseCase>(
      () => _i16.CreateNewPinUseCase(get<_i5.UserRepository>()));
  gh.factory<_i17.FillYourProfileUseCase>(
      () => _i17.FillYourProfileUseCase(get<_i5.UserRepository>()));
  gh.factory<_i18.GetInviteFriendsUseCase>(
      () => _i18.GetInviteFriendsUseCase(get<_i5.UserRepository>()));
  gh.factory<_i19.GetPaymentsUseCase>(
      () => _i19.GetPaymentsUseCase(get<_i5.UserRepository>()));
  gh.factory<_i20.GetProfileUseCase>(
      () => _i20.GetProfileUseCase(get<_i5.UserRepository>()));
  gh.lazySingleton<_i21.HelperApiService>(() => registerModule.helperApiService(
      get<_i3.Dio>(instanceName: 'ApiDio'),
      get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i22.HelperRepository>(
      () => _i23.HelperRepositoryImpl(get<_i21.HelperApiService>()));
  gh.lazySingleton<_i24.HomeApiService>(() => registerModule.homeApiService(
      get<_i3.Dio>(instanceName: 'ApiDio'),
      get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i25.HomeRepository>(
      () => _i26.HomeRepositoryImpl(get<_i24.HomeApiService>()));
  gh.factory<_i27.InviteFriendUseCase>(
      () => _i27.InviteFriendUseCase(get<_i5.UserRepository>()));
  gh.lazySingleton<_i28.MentorApiService>(() => registerModule.mentorApiService(
      get<_i3.Dio>(instanceName: 'ApiDio'),
      get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i29.MentorRepository>(
      () => _i30.MentorRepositoryImpl(get<_i28.MentorApiService>()));
  gh.factory<_i31.NewCardBloc>(
      () => _i31.NewCardBloc(get<_i7.AddNewCardUseCase>()));
  gh.lazySingleton<_i32.NotificationApiService>(() =>
      registerModule.notificationApiService(
          get<_i3.Dio>(instanceName: 'ApiDio'),
          get<String>(instanceName: 'ApiBaseUrl')));
  gh.factory<_i33.NotificationRepository>(() =>
      _i34.NotificationRepositoryImpl(get<_i32.NotificationApiService>()));
  gh.factory<_i35.PasswordCreationUseCase>(
      () => _i35.PasswordCreationUseCase(get<_i5.UserRepository>()));
  gh.factory<_i36.PaymentBloc>(
      () => _i36.PaymentBloc(get<_i19.GetPaymentsUseCase>()));
  gh.factory<_i37.PinEntryUseCase>(
      () => _i37.PinEntryUseCase(get<_i5.UserRepository>()));
  gh.factory<_i38.PinSendingUseCase>(
      () => _i38.PinSendingUseCase(get<_i5.UserRepository>()));
  gh.factory<_i39.ProfileBloc>(
      () => _i39.ProfileBloc(get<_i20.GetProfileUseCase>()));
  gh.factory<_i40.SignInUseCase>(
      () => _i40.SignInUseCase(get<_i5.UserRepository>()));
  gh.factory<_i41.SignUpUseCase>(
      () => _i41.SignUpUseCase(get<_i5.UserRepository>()));
  gh.factory<_i42.UpdateProfileUseCase>(
      () => _i42.UpdateProfileUseCase(get<_i5.UserRepository>()));
  gh.factory<_i43.BookmarkAdditionUseCase>(
      () => _i43.BookmarkAdditionUseCase(get<_i9.BookmarkRepository>()));
  gh.factory<_i44.BookmarkFetchUseCase>(
      () => _i44.BookmarkFetchUseCase(get<_i9.BookmarkRepository>()));
  gh.factory<_i45.BookmarkRemovalUseCase>(
      () => _i45.BookmarkRemovalUseCase(get<_i9.BookmarkRepository>()));
  gh.factory<_i46.ContactSelectionBloc>(() => _i46.ContactSelectionBloc(
      get<_i12.ContactSelectionUseCase>(), get<_i11.ContactFetchUseCase>()));
  gh.factory<_i47.CourseFetchUseCase>(
      () => _i47.CourseFetchUseCase(get<_i14.CourseRepository>()));
  gh.factory<_i48.CreateNewPinBloc>(
      () => _i48.CreateNewPinBloc(get<_i16.CreateNewPinUseCase>()));
  gh.factory<_i49.FillYourProfileBloc>(
      () => _i49.FillYourProfileBloc(get<_i17.FillYourProfileUseCase>()));
  gh.factory<_i50.FriendsInvitationBloc>(() => _i50.FriendsInvitationBloc(
      get<_i18.GetInviteFriendsUseCase>(), get<_i27.InviteFriendUseCase>()));
  gh.factory<_i51.GetCountriesUseCase>(
      () => _i51.GetCountriesUseCase(get<_i22.HelperRepository>()));
  gh.factory<_i52.GetHelperCenterUseCase>(
      () => _i52.GetHelperCenterUseCase(get<_i22.HelperRepository>()));
  gh.factory<_i53.GetLanguagesUseCase>(
      () => _i53.GetLanguagesUseCase(get<_i22.HelperRepository>()));
  gh.factory<_i54.HelperCenterBloc>(
      () => _i54.HelperCenterBloc(get<_i52.GetHelperCenterUseCase>()));
  gh.factory<_i55.HomeFetchUseCase>(
      () => _i55.HomeFetchUseCase(get<_i25.HomeRepository>()));
  gh.factory<_i56.LanguageBloc>(
      () => _i56.LanguageBloc(get<_i53.GetLanguagesUseCase>()));
  gh.factory<_i57.MentorFetchUseCase>(
      () => _i57.MentorFetchUseCase(get<_i29.MentorRepository>()));
  gh.factory<_i58.NotificationFetchUseCase>(
      () => _i58.NotificationFetchUseCase(get<_i33.NotificationRepository>()));
  gh.factory<_i59.PasswordCreationBloc>(
      () => _i59.PasswordCreationBloc(get<_i35.PasswordCreationUseCase>()));
  gh.factory<_i60.PinEntryBloc>(() => _i60.PinEntryBloc(
      get<_i38.PinSendingUseCase>(), get<_i37.PinEntryUseCase>()));
  gh.factory<_i61.SignInBloc>(() => _i61.SignInBloc(get<_i40.SignInUseCase>()));
  gh.factory<_i62.SignUpBloc>(() => _i62.SignUpBloc(get<_i41.SignUpUseCase>()));
  gh.factory<_i63.TopMentorsBloc>(
      () => _i63.TopMentorsBloc(get<_i57.MentorFetchUseCase>()));
  gh.factory<_i64.BookmarkBloc>(() => _i64.BookmarkBloc(
      get<_i44.BookmarkFetchUseCase>(), get<_i45.BookmarkRemovalUseCase>()));
  gh.factory<_i65.CourseBloc>(() => _i65.CourseBloc(
      get<_i47.CourseFetchUseCase>(),
      get<_i43.BookmarkAdditionUseCase>(),
      get<_i45.BookmarkRemovalUseCase>()));
  gh.factory<_i66.EditProfileBloc>(() => _i66.EditProfileBloc(
      get<_i51.GetCountriesUseCase>(), get<_i42.UpdateProfileUseCase>()));
  gh.factory<_i67.HomeBloc>(() => _i67.HomeBloc(get<_i55.HomeFetchUseCase>(),
      get<_i43.BookmarkAdditionUseCase>(), get<_i45.BookmarkRemovalUseCase>()));
  gh.factory<_i68.NotificationBloc>(
      () => _i68.NotificationBloc(get<_i58.NotificationFetchUseCase>()));
  return get;
}

class _$RegisterModule extends _i69.RegisterModule {}
