import '../../core/params/mentor_details_fetch_request_params.dart';
import '../../core/params/mentor_fetch_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../data/models/mentor/mentor_fetch_response_model.dart';
import '../../data/models/mentor_details/mentor_details_fetch_response_model.dart';

abstract class MentorRepository {
  Future<DataState<MentorFetchResponseModel>> getMentorFetchRequest(
    MentorFetchRequestParams? params,
  );

  Future<DataState<MentorDetailsFetchResponseModel>> getMentorDetailsFetchRequest(
    MentorDetailsFetchRequestParams? params,
  );
}
