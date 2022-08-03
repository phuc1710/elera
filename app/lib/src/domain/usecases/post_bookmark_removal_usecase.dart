import 'package:injectable/injectable.dart';

import '../../core/params/bookmark_removal_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/bookmark/bookmark_removal_response_model.dart';
import '../repositories/bookmark_repository.dart';

@injectable
class BookmarkRemovalUseCase
    implements
        UseCase<DataState<BookmarkRemovalResponseModel>,
            BookmarkRemovalRequestParams> {
  BookmarkRemovalUseCase(this._bookmarkRepository);

  final BookmarkRepository _bookmarkRepository;

  @override
  Future<DataState<BookmarkRemovalResponseModel>> call({
    BookmarkRemovalRequestParams? params,
  }) {
    return _bookmarkRepository.postBookmarkRemovalRequest(params);
  }
}
