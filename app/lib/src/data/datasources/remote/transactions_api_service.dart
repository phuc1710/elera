import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/nd_network/network/end_points.dart';
import '../../../core/params/transactions_request_params.dart';
import '../../models/transactions/transactions_response_model.dart';

part 'transactions_api_service.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl)
abstract class TransactionsApiService {
  factory TransactionsApiService(Dio dio, {String baseUrl}) =
      _TransactionsApiService;

  @GET(EndPoints.transactions)
  Future<HttpResponse<TransactionsResponseModel>> getTransactionsRequest({
    @Header('isMockup') bool? isMockup,
    @Queries() TransactionsRequestParams? query,
  });
}
