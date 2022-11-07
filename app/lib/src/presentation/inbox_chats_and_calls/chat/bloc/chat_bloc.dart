import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/params/chat_fetch_request_params.dart';
import '../../../../core/resources/api_error.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/constants.dart';
import '../../../../data/models/chat/chat_fetch_response_model.dart';
import '../../../../domain/usecases/get_chat_fetch_usecase.dart';

part 'chat_event.dart';
part 'chat_state.dart';

@injectable
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc(this.chatFetchUseCase) : super(ChatInitial()) {
    on<ChatFetched>(_onChatFetched);
  }

  final ChatFetchUseCase chatFetchUseCase;

  Future<void> _onChatFetched(
    ChatFetched event,
    Emitter<ChatState> emit,
  ) async {
    emit(ChatFetchInProgress());
    final dataState = await chatFetchUseCase(
      params: ChatFetchRequestParams(),
    );
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (dataState.data?.code == ErrorCode.success)
        emit(ChatFetchSuccess(res?.data));
      else
        emit(
          ChatFetchFailure(
            ApiError(errorCode: res?.code, errorMessage: res?.message),
          ),
        );
    }
    if (dataState is DataFailed) {
      emit(
        ChatFetchFailure(
          ApiError(errorMessage: dataState.error?.message),
        ),
      );
    }
  }
}
