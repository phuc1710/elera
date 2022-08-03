import '../../core/params/bookmark_addition_request_params.dart';
import '../../core/params/bookmark_fetch_request_params.dart';
import '../../core/params/bookmark_removal_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../data/models/bookmark/bookmark_addition_response_model.dart';
import '../../data/models/bookmark/bookmark_fetch_response_model.dart';
import '../../data/models/bookmark/bookmark_removal_response_model.dart';

abstract class BookmarkRepository {
  Future<DataState<BookmarkFetchResponseModel>> getBookmarkFetchRequest(
    BookmarkFetchRequestParams? params,
  );

  Future<DataState<BookmarkAdditionResponseModel>> postBookmarkAdditionRequest(
    BookmarkAdditionRequestParams? params,
  );

  Future<DataState<BookmarkRemovalResponseModel>> postBookmarkRemovalRequest(
    BookmarkRemovalRequestParams? params,
  );
}
