import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/params/notification_fetch_request_params.dart';
import '../../../../core/resources/api_error.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/constants.dart';
import '../../../../data/models/notification/notification_fetch_response_model.dart';
import '../../../../domain/usecases/get_notification_fetch_usecase.dart';

part 'notification_event.dart';
part 'notification_state.dart';

@injectable
class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc(this.notificationFetchUseCase)
      : super(NotificationFetchInitial()) {
    on<NotificationFetched>(_onNotificationFetched);
  }

  final NotificationFetchUseCase notificationFetchUseCase;

  Future<void> _onNotificationFetched(
    NotificationFetched event,
    Emitter<NotificationState> emit,
  ) async {
    emit(NotificationFetchInProgress());
    final dataState = await notificationFetchUseCase(
      params: NotificationFetchRequestParams(),
    );
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (dataState.data?.errorCode == ErrorCode.success)
        emit(NotificationFetchSuccess(res?.data));
      else
        emit(
          NotificationFetchFailure(
            ApiError(errorCode: res?.errorCode, errorMessage: res?.message),
          ),
        );
    }
    if (dataState is DataFailed) {
      emit(
        NotificationFetchFailure(
          ApiError(errorMessage: dataState.error?.message),
        ),
      );
    }
  }
}
