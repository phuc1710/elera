import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/nd_network/network/end_points.dart';

import '../../../core/params/e_receipt_request_params.dart';
import '../../models/e_receipt/e_receipt_response.dart';

part 'e_receipt_api_service.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class EReceiptApiService {
  factory EReceiptApiService(Dio dio, {String baseUrl}) = _EReceiptApiService;

  @GET(EndPoints.eReceipt)
  Future<HttpResponse<EReceiptResponseModel>> getEReceiptRequest({
    @Header('isMockup') bool? isMockup,
    @Queries() EReceiptRequestParams? query,
  });
}
