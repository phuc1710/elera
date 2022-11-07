import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/params/inbox_fetch_request_params.dart';
import '../../../../core/resources/api_error.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/constants.dart';
import '../../../../data/models/inbox/inbox_fetch_response_model.dart';
import '../../../../domain/usecases/get_inbox_fetch_usecase.dart';

part 'inbox_event.dart';
part 'inbox_state.dart';

@injectable
class InboxBloc extends Bloc<InboxEvent, InboxState> {
  InboxBloc(this.inboxFetchUseCase) : super(InboxInitial()) {
    on<InboxFetched>(_onInboxFetched);
  }

  final InboxFetchUseCase inboxFetchUseCase;

  Future<void> _onInboxFetched(
    InboxFetched event,
    Emitter<InboxState> emit,
  ) async {
    emit(InboxFetchInProgress());
    final dataState = await inboxFetchUseCase(
      params: InboxFetchRequestParams(),
    );
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (dataState.data?.code == ErrorCode.success)
        emit(InboxFetchSuccess(res?.data));
      else
        emit(
          InboxFetchFailure(
            ApiError(errorCode: res?.code, errorMessage: res?.message),
          ),
        );
    }
    if (dataState is DataFailed) {
      emit(
        InboxFetchFailure(
          ApiError(errorMessage: dataState.error?.message),
        ),
      );
    }
  }
}
