import 'package:get_it/get_it.dart';

import 'core/nd_network/nd_network.dart';
import 'data/datasources/remote/user_api_service.dart';
import 'data/repositories/user_repository_impl.dart';
import 'domain/repositories/sign_in_repositories.dart';
import 'domain/usecases/sign_in_usecase.dart';
import 'presentation/letsin/signin/bloc/signin_bloc.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  injector.registerSingleton<Network>(
    Network(
      enableLogger: true,
      environment: Environment.sandbox,
      getHeadersApiProvider: () async {
        final Map<String, dynamic> header = <String, dynamic>{
          'version': 'version app',
          'token': 'token',
        };

        return header;
      },
    ),
  );

  // Dio client
  injector.registerSingleton<Dio>(injector<Network>().apiProvider.apiDio);

  // Dependencies
  injector.registerSingleton(UserApiService(injector()));
  injector
      .registerSingleton<SignInRepository>(SignInRepositoryImpl(injector()));

  // UseCases
  injector.registerSingleton(SignInUseCase(injector()));

  //Blocs
  injector.registerFactory(() => SignInBloc(injector()));
}
