import 'package:injectable/injectable.dart';

import '../../core/params/bookmark_fetch_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/bookmark/bookmark_fetch_response_model.dart';
import '../repositories/bookmark_repository.dart';

@injectable
class BookmarkFetchUseCase
    implements
        UseCase<DataState<BookmarkFetchResponseModel>,
            BookmarkFetchRequestParams> {
  BookmarkFetchUseCase(this._bookmarkRepository);

  final BookmarkRepository _bookmarkRepository;

  @override
  Future<DataState<BookmarkFetchResponseModel>> call({
    BookmarkFetchRequestParams? params,
  }) {
    return _bookmarkRepository.getBookmarkFetchRequest(params);
  }
}
