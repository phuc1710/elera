import 'package:get_it/get_it.dart';

import 'core/nd_network/nd_network.dart';
import 'data/datasources/remote/user_api_service.dart';
import 'data/repositories/user_repository_impl.dart';
import 'domain/repositories/user_repository.dart';
import 'domain/usecases/create_new_pin_usecase.dart';
import 'domain/usecases/fill_your_profile_usecase.dart';
import 'domain/usecases/sign_in_usecase.dart';
import 'domain/usecases/sign_up_usecase.dart';
import 'presentation/account_setup/create_new_pin/bloc/create_new_pin_bloc.dart';
import 'presentation/account_setup/fill_your_profile/bloc/fill_your_profile_bloc.dart';
import 'presentation/letsin/signin/bloc/signin_bloc.dart';
import 'presentation/letsin/signup/bloc/signup_bloc.dart';

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
  injector.registerSingleton<UserRepository>(UserRepositoryImpl(injector()));

  // UseCases
  injector.registerSingleton(SignInUseCase(injector()));
  injector.registerSingleton(SignUpUseCase(injector()));
  injector.registerSingleton(FillYourProfileUseCase(injector()));
  injector.registerSingleton(CreateNewPinUseCase(injector()));

  //Blocs
  injector.registerFactory(() => SignInBloc(injector()));
  injector.registerFactory(() => SignUpBloc(injector()));
  injector.registerFactory(() => FillYourProfileBloc(injector()));
  injector.registerFactory(() => CreateNewPinBloc(injector()));
}
