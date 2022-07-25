import '../../core/params/home_fetch_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../data/models/home/home_fetch_response_model.dart';

abstract class HomeRepository {
  Future<DataState<HomeFetchResponseModel>> getHomeFetchRequest(
    HomeFetchRequestParams? params,
  );
}
