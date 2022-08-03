import 'package:retrofit/retrofit.dart';

import '../../../core/nd_network/nd_network.dart';
import '../../models/api_models.dart';
import '../../models/edit_profile/edit_profile_response_model.dart';
import '../../models/language/language_response_model.dart';

part 'helper_api_service.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class HelperApiService {
  factory HelperApiService(Dio dio, {String baseUrl}) = _HelperApiService;

  @GET(EndPoints.languages)
  Future<HttpResponse<LanguageResponseModel?>> getLanguages({
    @Header('isMockup') bool? isMockup,
  });

  @GET(EndPoints.countries)
  Future<HttpResponse<EditProfileResponseModel?>> getCountries({
    @Header('isMockup') bool? isMockup,
  });

  @GET(EndPoints.helperCenter)
  Future<HttpResponse<HelperCenterResponseModel?>> getHelperCenter({
    @Header('isMockup') bool? isMockup,
  });
}
