import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../core/params/new_card_params.dart';
import '../../../core/resources/data_state.dart';
import '../../../core/utils/constants.dart';
import '../../../domain/usecases/add_new_card_usecase.dart';

part 'new_card_event.dart';
part 'new_card_state.dart';

@injectable
class NewCardBloc extends Bloc<NewCardEvent, NewCardState> {
  NewCardBloc(this._addNewCardUC) : super(NewCardInitial()) {
    on<NewCardEvent>((event, emit) {});

    on<NewCardAdded>(_addNewCard);
  }

  final AddNewCardUseCase _addNewCardUC;

  Future<void> _addNewCard(
    NewCardAdded event,
    Emitter<NewCardState> emit,
  ) async {
    emit(NewCardInProgress());

    final dataState = await _addNewCardUC(params: event.params);
    if (dataState is DataSuccess) {
      final res = dataState.data;
      if (res?.status == StatusCode.success) {
        emit(NewCardAddSuccess(msg: res?.message));
      } else {
        emit(NewCardFailure(msg: res?.message));
      }
    }
    if (dataState is DataFailed) {
      emit(NewCardFailure(msg: dataState.error?.message));
    }
  }
}
