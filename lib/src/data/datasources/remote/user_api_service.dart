import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/params/sign_in_request_params.dart';
import '../../../core/utils/constants.dart';
import '../../models/sign_in/sign_in_response_model.dart';

part 'user_api_service.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class UserApiService {
  factory UserApiService(Dio dio, {String baseUrl}) = _UserApiService;

  @POST('/login')
  Future<HttpResponse<SignInResponseModel>> postSignInRequest({
    @Header('isMockup') bool? isMockup,
    @Queries() SignInRequestParams? body,
  });
}
