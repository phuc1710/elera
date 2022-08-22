import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/constants.dart';
import '../../../../data/models/e_receipt/e_receipt_response.dart';
import '../../../../domain/usecases/get_e_receipt_usecase.dart';

part 'e_receipt_event.dart';
part 'e_receipt_state.dart';

@injectable
class EReceiptBloc extends Bloc<EReceiptEvent, EReceiptState> {
  EReceiptBloc(
    this._getEReceiptUC,
  ) : super(EReceiptInitial()) {
    on<EReceiptEvent>((event, emit) {});

    on<EReceiptStarted>(_fetchEReceipt);
  }

  final GetEReceiptUseCase _getEReceiptUC;

  Future<void> _fetchEReceipt(
    EReceiptStarted event,
    Emitter<EReceiptState> emit,
  ) async {
    emit(EReceiptInProgress());

    final dataState = await _getEReceiptUC();
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (res?.code == ErrorCode.success) {
        emit(
          EReceiptFetchSuccess(
            eReceipt: res?.data,
          ),
        );
      } else {
        emit(EReceiptFailure(msg: res?.message));
      }
    }
    if (dataState is DataFailed) {
      emit(EReceiptFailure(msg: dataState.error?.message));
    }
  }
}
