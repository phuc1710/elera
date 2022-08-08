import 'package:injectable/injectable.dart';

import '../../core/params/bookmark_addition_request_params.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecases.dart';
import '../../data/models/bookmark/bookmark_addition_response_model.dart';
import '../repositories/bookmark_repository.dart';

@injectable
class BookmarkAdditionUseCase
    implements
        UseCase<DataState<BookmarkAdditionResponseModel>,
            BookmarkAdditionRequestParams> {
  BookmarkAdditionUseCase(this._bookmarkRepository);

  final BookmarkRepository _bookmarkRepository;

  @override
  Future<DataState<BookmarkAdditionResponseModel>> call({
    BookmarkAdditionRequestParams? params,
  }) {
    return _bookmarkRepository.postBookmarkAdditionRequest(params);
  }
}
