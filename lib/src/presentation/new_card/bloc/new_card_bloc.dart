import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/network/api.dart';
import '../../../core/params/new_card_params.dart';
import '../../../core/utils/constants.dart';

part 'new_card_event.dart';
part 'new_card_state.dart';

class NewCardBloc extends Bloc<NewCardEvent, NewCardState> {
  NewCardBloc() : super(NewCardInitial()) {
    on<NewCardEvent>((event, emit) {});

    on<NewCardAdded>(_addNewCard);
  }

  Future<void> _addNewCard(
    NewCardAdded event,
    Emitter<NewCardState> emit,
  ) async {
    emit(NewCardInProgress());
    try {
      final res = await Api.addNewCard(event.params);
      if (res?.status == StatusCode.success) {
        emit(NewCardAddSuccess(msg: res?.message));
      } else {
        emit(NewCardFailure(msg: res?.message));
      }
    } catch (_) {
      emit(const NewCardFailure());
    }
  }
}
