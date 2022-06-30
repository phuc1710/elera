import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/network/api.dart';
import '../../../core/utils/constants.dart';
import '../../../data/models/helper_center/helper_center_response_model.dart';

part 'helper_center_event.dart';
part 'helper_center_state.dart';

class HelperCenterBloc extends Bloc<HelperCenterEvent, HelperCenterState> {
  HelperCenterBloc() : super(HelperCenterInitial()) {
    on<HelperCenterEvent>((event, emit) {});

    on<HelperCenterStarted>(_fetchHelperCenter);
  }

  Future<void> _fetchHelperCenter(
    HelperCenterStarted event,
    Emitter<HelperCenterState> emit,
  ) async {
    emit(HelperCenterInProgress());
    try {
      final res = await Api.getHelperCenter();
      if (res?.status == StatusCode.success) {
        emit(HelperCenterFetchSuccess(res?.data));
      } else {
        emit(HelperCenterFailure(msg: res?.message));
      }
    } catch (_) {
      emit(const HelperCenterFailure());
    }
  }
}
