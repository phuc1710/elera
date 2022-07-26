import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../core/resources/data_state.dart';
import '../../../core/utils/constants.dart';
import '../../../data/models/helper_center/helper_center_response_model.dart';
import '../../../domain/usecases/get_helper_center_usecase.dart';

part 'helper_center_event.dart';
part 'helper_center_state.dart';

@injectable
class HelperCenterBloc extends Bloc<HelperCenterEvent, HelperCenterState> {
  HelperCenterBloc(this._getHelperCenterUC) : super(HelperCenterInitial()) {
    on<HelperCenterEvent>((event, emit) {});

    on<HelperCenterStarted>(_fetchHelperCenter);
  }

  final GetHelperCenterUseCase _getHelperCenterUC;

  Future<void> _fetchHelperCenter(
    HelperCenterStarted event,
    Emitter<HelperCenterState> emit,
  ) async {
    emit(HelperCenterInProgress());

    final dataState = await _getHelperCenterUC();
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (res?.errorCode == ErrorCode.success) {
        emit(HelperCenterFetchSuccess(res?.data));
      } else {
        emit(HelperCenterFailure(msg: res?.message));
      }
    }
    if (dataState is DataFailed) {
      emit(HelperCenterFailure(msg: dataState.error?.message));
    }
  }
}
