import 'package:injectable/injectable.dart';

import '../config/defines/keys.dart';
import '../core/nd_network/nd_network.dart';
import '../data/datasources/remote/bookmark_api_service.dart';
import '../data/datasources/remote/course_api_service.dart';
import '../data/datasources/remote/helper_api_service.dart';
import '../data/datasources/remote/home_api_service.dart';
import '../data/datasources/remote/mentor_api_service.dart';
import '../data/datasources/remote/notification_api_service.dart';
import '../data/datasources/remote/user_api_service.dart';
import '../injector/injector.dart';

@module
abstract class RegisterModule {
  @Named(kApiDio)
  Dio get apiDio => injector<Network>().apiProvider.apiDio;

  @Named(kApiBaseUrl)
  String get apiBaseUrl =>
      injector<Network>().apiProvider.apiDio.options.baseUrl;

  @lazySingleton
  UserApiService userApiService(
    @Named(kApiDio) Dio dio,
    @Named(kApiBaseUrl) String url,
  ) =>
      UserApiService(dio, baseUrl: url);

  @lazySingleton
  HomeApiService homeApiService(
    @Named(kApiDio) Dio dio,
    @Named(kApiBaseUrl) String url,
  ) =>
      HomeApiService(dio, baseUrl: url);

  @lazySingleton
  NotificationApiService notificationApiService(
    @Named(kApiDio) Dio dio,
    @Named(kApiBaseUrl) String url,
  ) =>
      NotificationApiService(dio, baseUrl: url);

  @lazySingleton
  BookmarkApiService bookmarkApiService(
    @Named(kApiDio) Dio dio,
    @Named(kApiBaseUrl) String url,
  ) =>
      BookmarkApiService(dio, baseUrl: url);

  @lazySingleton
  MentorApiService mentorApiService(
    @Named(kApiDio) Dio dio,
    @Named(kApiBaseUrl) String url,
  ) =>
      MentorApiService(dio, baseUrl: url);

  @lazySingleton
  CourseApiService courseApiService(
    @Named(kApiDio) Dio dio,
    @Named(kApiBaseUrl) String url,
  ) =>
      CourseApiService(dio, baseUrl: url);

  @lazySingleton
  HelperApiService helperApiService(
    @Named(kApiDio) Dio dio,
    @Named(kApiBaseUrl) String url,
  ) =>
      HelperApiService(dio, baseUrl: url);
}
